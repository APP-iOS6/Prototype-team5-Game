//
//  LoginViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/27/24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // UI 요소들 정의
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star")) // 로고 이미지
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "최고의 플레이" // 타이틀 텍스트
        label.font = UIFont.boldSystemFont(ofSize: 44)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력하세요" // 아이디 입력 필드
        textField.borderStyle = .line
        textField.addAction(UIAction { _ in
            print("ID TextField editingChanged : \(textField.text ?? "(none)")")
        }, for: .editingChanged)
        
        textField.addAction(UIAction { _ in
            print("ID TextField editingDidBegin : \(textField.text ?? "(none)")")
        }, for: .editingDidBegin)
        
        textField.addAction(UIAction { _ in
            print("ID TextField editingDidEnd : \(textField.text ?? "(none)")")
        }, for: .editingDidEnd)
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력하세요" // 비밀번호 입력 필드
        textField.borderStyle = .line
        textField.isSecureTextEntry = true // 비밀번호 가리기
        textField.addAction(UIAction { _ in
            print("Password TextField editingChanged : \(textField.text ?? "(none)")")
        }, for: .editingChanged)
        
        textField.addAction(UIAction { _ in
            print("Password TextField editingDidBegin : \(textField.text ?? "(none)")")
        }, for: .editingDidBegin)
        
        textField.addAction(UIAction { _ in
            print("Password TextField editingDidEnd : \(textField.text ?? "(none)")")
        }, for: .editingDidEnd)
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal) // 로그인 버튼
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입", for: .normal) // 회원가입 버튼
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("비밀번호 찾기", for: .normal) // 비밀번호 찾기 버튼
        button.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        // 스택뷰에 UI 요소들을 배치
        let stackView = UIStackView(arrangedSubviews: [logoImageView, titleLabel, idTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 로그인 버튼 액션
    @objc private func handleLogin() {
        print("로그인 버튼 눌림")
    }
    
    // 회원가입 버튼 액션
    @objc private func handleSignUp() {
        print("회원가입 버튼 눌림")
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    // 비밀번호 찾기 버튼 액션
    @objc private func handleForgotPassword() {
        print("비밀번호 찾기 버튼 눌림")
    }
    
    // 뷰가 로드될 때 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UI 요소들을 추가하는 메서드
    override func setupInterface() {
        super.setupInterface()
        
        // 스택뷰와 로고 이미지를 부모 뷰에 추가
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        // 스택뷰에 다른 UI 요소들을 추가
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        
        // 회원가입 및 비밀번호 찾기 버튼을 하단에 추가
        let bottomStackView = UIStackView(arrangedSubviews: [signUpButton, forgotPasswordButton])
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        stackView.addArrangedSubview(bottomStackView)
        
        // 스택뷰 기본 설정
        stackView.spacing = 16
        stackView.alignment = .center
        
        // 스택뷰 내의 각 요소의 너비 설정
        [idTextField, passwordTextField, loginButton, bottomStackView].forEach { view in
            view.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8).isActive = true
        }
    }
    
    // 레이아웃 제약 조건을 설정하는 메서드
    override func setupLayout() {
        super.setupLayout()
        
        // 오토레이아웃 제약 조건 설정
        NSLayoutConstraint.activate([
            // 로고 이미지뷰의 제약 조건 설정
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            
            // 스택뷰의 제약 조건 설정
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

#Preview {
    LoginViewController()
}
