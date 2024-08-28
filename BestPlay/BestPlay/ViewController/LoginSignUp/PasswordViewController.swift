//
//  PasswordViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

class PasswordViewController: UIViewController {
    
    // UI 요소들 정의
    private lazy var passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "비밀번호" // 비밀번호 입력 필드
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        return textField
    }()
    
    private lazy var confirmPasswordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "비밀번호 확인" // 비밀번호 확인 입력 필드
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음", for: .normal) // 다음 버튼
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.setProgress(0.4, animated: true) // 두 번째 단계 진행 상황
        return progressView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [progressView, passwordTextField, confirmPasswordTextField, nextButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "비밀번호 입력"
        setupInterface()
    }
    
    private func setupInterface() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func handleNext() {
        let nicknameVC = NicknameViewController()
        navigationController?.pushViewController(nicknameVC, animated: true)
    }
}

#Preview {
    PasswordViewController()
}
