//
//  ProfileImageViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

class ProfileImageViewController: BaseSignUpViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "사용하실 이미지를 선택해주세요." // 설명 라벨 텍스트
        label.font = UIFont(name: "Paperlogy 7 Bold", size: 18) // 원하는 폰트와 크기 설정
        label.textColor = UIColor.systemGray // 글씨색 회색으로 설정
        label.numberOfLines = 1 // 여러 줄 텍스트 허용
        label.textAlignment = .left // 텍스트 가운데 정렬
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // 이미지가 동그랗게 표시되도록 설정
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .gray
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true // 이미지가 이미지뷰의 경계를 넘어가지 않도록 설정
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.isUserInteractionEnabled = true  // 이미지뷰 터치 활성화
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressValue = 1.0
        setupProfileImageView()
    }

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

    private func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    // UIImagePickerControllerDelegate 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    override func handleNextButtonTapped() {
        let favoriteGameVC = FavoriteGameViewController()
        navigationController?.pushViewController(favoriteGameVC, animated: true)
    }
}


#Preview {
    ProfileImageViewController()
}
