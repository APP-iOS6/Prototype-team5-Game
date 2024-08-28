//
//  PasswordViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

class PasswordViewController: BaseSignUpViewController {

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인에 사용할\n비밀번호를 입력해주세요." // 설명 라벨 텍스트
        label.font = UIFont(name: "Paperlogy 7 Bold", size: 18) // 원하는 폰트와 크기 설정
        label.textColor = UIColor.systemGray // 글씨색 회색으로 설정
        label.numberOfLines = 0 // 여러 줄 텍스트 허용
        label.textAlignment = .left // 텍스트 가운데 정렬
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var confirmPasswordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "비밀번호 확인"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        progressValue = 0.5
        setupPasswordView()
    }

    private func setupPasswordView() {
        view.addSubview(descriptionLabel)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            passwordTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        nextButton.addTarget(self, action: #selector(handleNextButtonTapped), for: .touchUpInside)
    }

    override func handleNextButtonTapped() {
        let nicknameVC = NicknameViewController()
        navigationController?.pushViewController(nicknameVC, animated: true)
    }
}

#Preview {
    PasswordViewController()
}
