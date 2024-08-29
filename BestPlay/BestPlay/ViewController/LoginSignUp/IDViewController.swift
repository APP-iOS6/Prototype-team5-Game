//
//  IDViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

// 아이디 입력 화면 ViewController
class IDViewController: BaseSignUpViewController {

    // 아이디 입력 필드 설정
    private lazy var idTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        return textField
    }()

    // 설명 레이블 설정
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인에 사용할\n아이디를 입력해주세요"
        label.font = UIFont(name: "Paperlogy 7 Bold", size: 18)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0 // 여러 줄 텍스트 허용
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        progressValue = 0.25 // 진행 상태 값 설정
        setupIDView() // IDView 설정
    }

    // IDView 레이아웃 설정
    private func setupIDView() {
        view.addSubview(descriptionLabel)
        view.addSubview(idTextField)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            idTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        nextButton.addTarget(self, action: #selector(handleNextButtonTapped), for: .touchUpInside)
    }

    // '다음' 버튼 동작
    override func handleNextButtonTapped() {
        let passwordVC = PasswordViewController()
        navigationController?.pushViewController(passwordVC, animated: true)
    }
}

#Preview {
    IDViewController()
}
