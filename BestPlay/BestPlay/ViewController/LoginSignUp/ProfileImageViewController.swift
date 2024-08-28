//
//  ProfileImageViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

class ProfileImageViewController: BaseSignUpViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .gray
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
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
        view.addSubview(profileImageView)

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
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
