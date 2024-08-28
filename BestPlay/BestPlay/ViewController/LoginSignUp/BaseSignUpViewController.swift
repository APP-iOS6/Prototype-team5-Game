//
//  BaseSignUpViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

class BaseSignUpViewController: UIViewController {

    // 공통적으로 사용할 UI 요소들
    let progressView = UIProgressView(progressViewStyle: .default)
    let nextButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupInterface()
        setupLayout()
    }

    // 공통 UI 설정 메서드
    func setupInterface() {
        progressView.progress = 0.25
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)

        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nextButton.backgroundColor = .systemBlue
        nextButton.layer.cornerRadius = 10
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
    }

    // 공통 레이아웃 설정 메서드
    func setupLayout() {
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // 공통 동작 메서드 (필요 시 추가 가능)
    @objc func handleNextButtonTapped() {
        // 각 자식 클래스에서 override 하여 사용 가능
    }
}
