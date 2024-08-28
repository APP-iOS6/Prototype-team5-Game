//
//  BaseSignUpViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/28/24.
//

import UIKit

// 회원가입 기본 ViewController
class BaseSignUpViewController: UIViewController {
    
    // 공통 UI 요소
    let progressView = UIProgressView(progressViewStyle: .default)
    let nextButton = UIButton(type: .system)
    var progressValue: Float = 0.0 {
        didSet {
            progressView.setProgress(progressValue, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupInterface() // UI 설정
        setupLayout() // 레이아웃 설정
    }

    // 공통 UI 설정
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

    // 공통 레이아웃 설정
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
    
    // Progress 애니메이션
    func animateProgress() {
        progressView.setProgress(progressValue, animated: true)
    }

    // '다음' 버튼 동작 (자식 클래스에서 override 가능)
    @objc func handleNextButtonTapped() {
        // 각 자식 클래스에서 구현
    }
}
