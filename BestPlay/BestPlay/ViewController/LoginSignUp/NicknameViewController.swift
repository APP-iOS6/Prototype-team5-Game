//
//  NicknameViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

// 닉네임 입력 화면 ViewController
class NicknameViewController: BaseSignUpViewController {
    
    // 설명 라벨 설정
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "사용하실 닉네임을 입력해주세요."
        label.font = UIFont(name: "Paperlogy 7 Bold", size: 18)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // 닉네임 입력 필드 설정
    private lazy var nicknameTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "닉네임"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        progressValue = 0.75 // 진행 상태 값 설정
        setupNicknameView() // 닉네임 뷰 설정
    }

    // 닉네임 뷰 레이아웃 설정
    private func setupNicknameView() {
        view.addSubview(descriptionLabel)
        view.addSubview(nicknameTextField)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            nicknameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        nextButton.addTarget(self, action: #selector(handleNextButtonTapped), for: .touchUpInside)
    }

    // '다음' 버튼 동작
    override func handleNextButtonTapped() {
        let profileVC = ProfileImageViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

#Preview {
    NicknameViewController()
}
