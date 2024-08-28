//
//  ProfileImageViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

// 프로필 이미지 선택 화면 ViewController
class ProfileImageViewController: BaseSignUpViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 설명 라벨 설정
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "사용하실 이미지를 선택해주세요."
        label.font = UIFont(name: "Paperlogy 7 Bold", size: 18)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // 프로필 이미지 뷰 설정
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .gray
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressValue = 1.0 // 진행 상태 값 설정
        setupProfileImageView() // 프로필 이미지 뷰 설정
    }

    // 프로필 이미지 뷰 레이아웃 설정
    private func setupProfileImageView() {
        view.addSubview(descriptionLabel)
        view.addSubview(profileImageView)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            profileImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        nextButton.addTarget(self, action: #selector(handleNextButtonTapped), for: .touchUpInside)
    }

    // 프로필 이미지 선택 처리
    @objc private func handleImageTap() {
        let alert = UIAlertController(title: "프로필 이미지", message: "이미지를 선택하세요", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "사진첩에서 선택", style: .default, handler: { _ in
            self.presentImagePicker()
        }))
        
        alert.addAction(UIAlertAction(title: "기본 이미지 사용", style: .default, handler: { _ in
            self.profileImageView.image = UIImage(systemName: "person.circle")
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }

    // 이미지 선택 화면 표시
    private func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    // 이미지 선택 완료 시 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }

    // 이미지 선택 취소 시 호출되는 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    // '다음' 버튼 동작
    override func handleNextButtonTapped() {
        let favoriteGameVC = FavoriteGameViewController()
        navigationController?.pushViewController(favoriteGameVC, animated: true)
    }
}

#Preview {
    ProfileImageViewController()
}
