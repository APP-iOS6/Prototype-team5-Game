//
//  IDViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

class IDViewController: BaseSignUpViewController {

    private lazy var idTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인에 사용할\n아이디를 입력해주세요"
        label.font = UIFont(name: "Paperlogy 7 Bold", size: 18)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0 // 여러 줄 텍스트 허용
        label.textAlignment = .left // 텍스트 가운데 정렬
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        progressValue = 0.25
        setupIDView()
    }

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

    override func handleNextButtonTapped() {
        let passwordVC = PasswordViewController()
        navigationController?.pushViewController(passwordVC, animated: true)
    }
}

#Preview {
    IDViewController()
}


#Preview {
    IDViewController()
}
