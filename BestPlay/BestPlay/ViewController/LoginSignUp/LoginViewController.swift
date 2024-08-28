//
//  LoginViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/27/24.
//

import UIKit

// 커스텀 텍스트 필드 클래스, 텍스트 필드에 패딩을 추가
class PaddedTextField: UITextField {
    var padding = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

// 로그인 뷰 컨트롤러
class LoginViewController: BaseViewController {
    
    // 제목 레이블
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "최고의 플레이"
        label.font = UIFont(name: "Paperlogy 7 Bold", size: 40)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 부제목 레이블
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "최고의 플레이에 도전해 보세요"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 아이디 입력 텍스트 필드
    private lazy var idTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "아이디를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        return textField
    }()
    
    // 비밀번호 입력 텍스트 필드
    private lazy var passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "비밀번호를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        return textField
    }()
    
    // 로그인 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = .systemBlue
        // 로그인 버튼이 눌렸을 때 실행되는 액션 설정
        button.addAction(UIAction { _ in
            let tabBarViewController = MainTabBarViewController()
            tabBarViewController.modalPresentationStyle = .fullScreen
            self.present(tabBarViewController, animated: true)
        }, for: .touchUpInside)
        return button
    }()
    
    // 회원가입 버튼
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입", for: .normal)
        // 회원가입 버튼이 눌렸을 때 실행되는 액션 설정
        button.addAction(UIAction { [weak self] _ in
            let idVC = IDViewController()
            self?.navigationController?.pushViewController(idVC, animated: true)
        }, for: .touchUpInside)
        return button
    }()
    
    // 비밀번호 찾기 버튼
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("비밀번호 찾기", for: .normal)
        return button
    }()
    
    // 네이버 로그인 버튼
    private lazy var naverButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("네이버 로그인", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        
        for family in UIFont.familyNames {
            print("Family: \(family)")
            
            for name in UIFont.fontNames(forFamilyName: family) {
                print("Font Name: \(name)")
            }
        }
 
        return button
    }()
    
    // 카카오 로그인 버튼
    private lazy var kakaoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오 로그인", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // 구글 로그인 버튼
    private lazy var googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("구글 로그인", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()

    // 페이스북 로그인 버튼
    private lazy var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("페이스북 로그인", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // 로그인 관련 UI 요소들을 담은 스택뷰
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 소셜 로그인 버튼들을 담은 스택뷰
    private lazy var socialStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [naverButton, kakaoButton, googleButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 뷰가 로드될 때 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UI 구성 요소를 설정하는 메서드
    override func setupInterface() {
        super.setupInterface()
        
        // 뷰에 UI 요소 추가
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(stackView)
        view.addSubview(socialStackView)
        
        // 회원가입 및 비밀번호 찾기 버튼을 담은 스택뷰 추가
        let bottomStackView = UIStackView(arrangedSubviews: [signUpButton, forgotPasswordButton])
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        stackView.addArrangedSubview(bottomStackView)
        
        // 스택뷰에 포함된 모든 뷰의 너비를 동일하게 설정
        [idTextField, passwordTextField, loginButton, bottomStackView].forEach { view in
            view.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1).isActive = true
        }
    }
    
    // 레이아웃 제약 조건을 설정하는 메서드
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            // 제목 레이블 레이아웃 설정
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46),
            
            // 부제목 레이블 레이아웃 설정
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            // 로그인 관련 스택뷰 레이아웃 설정
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            
            // 소셜 로그인 스택뷰 레이아웃 설정
            socialStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            socialStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            socialStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            socialStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}

#Preview {
    LoginViewController()
}
