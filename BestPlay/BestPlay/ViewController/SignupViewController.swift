//
//  SignupViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/27/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // UI 요소들 정의
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디" // 아이디 입력 필드
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호" // 비밀번호 입력 필드
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        return textField
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 확인" // 비밀번호 확인 입력 필드
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        return textField
    }()
    
    private lazy var nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임" // 닉네임 입력 필드
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        return textField
    }()
    
    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "생일 (YYYY-MM-DD)" // 생일 입력 필드
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        return textField
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle") // 기본 프로필 이미지
        imageView.tintColor = .gray
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
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
    
    private lazy var stackView: UIStackView = {
        // 스택뷰에 UI 요소들을 세로로 배치
        let stackView = UIStackView(arrangedSubviews: [profileImageView, idTextField, passwordTextField, confirmPasswordTextField, nicknameTextField, birthdayTextField, nextButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 뷰가 로드될 때 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupInterface() // UI 설정
    }
    
    // UI 요소들을 뷰에 추가하고 레이아웃 설정
    private func setupInterface() {
        view.addSubview(stackView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50) // 다음 버튼의 높이 설정
        ])
        
        // 생일 입력 필드와 다음 버튼 사이에 공간 추가
        stackView.setCustomSpacing(40, after: birthdayTextField)
    }
    
    // 다음 버튼 액션
    @objc private func handleNext() {
        let favoriteGameVC = FavoriteGameViewController()
        navigationController?.pushViewController(favoriteGameVC, animated: true) // 관심 게임 설정 화면으로 이동
    }
}

#Preview {
    SignUpViewController()
}
