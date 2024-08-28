//
//  NicknameViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

class NicknameViewController: BaseSignUpViewController {

    private lazy var nicknameTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "닉네임"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNicknameView()
    }

    private func setupNicknameView() {
        view.addSubview(nicknameTextField)

        NSLayoutConstraint.activate([
            nicknameTextField.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        nextButton.addTarget(self, action: #selector(handleNextButtonTapped), for: .touchUpInside)
    }

    override func handleNextButtonTapped() {
        let profileVC = ProfileImageViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}


#Preview {
    NicknameViewController()
}
