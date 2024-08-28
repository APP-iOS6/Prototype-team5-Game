//
//  ProfileImageViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

class ProfileImageViewController: BaseSignUpViewController {

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

    override func handleNextButtonTapped() {
        let favoriteGameVC = FavoriteGameViewController()
        navigationController?.pushViewController(favoriteGameVC, animated: true)
    }
}


#Preview {
    ProfileImageViewController()
}
