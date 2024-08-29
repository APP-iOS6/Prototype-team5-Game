//
//  SettingViewController.swift
//  BestPlay
//
//  Created by Min on 8/27/24.
//

import UIKit

// 설정 페이지 ViewController
class SettingViewController: UIViewController {
    
    // view에 들어갈 vStackView
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장됨", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.addAction(UIAction { _ in
            print("저장됨 확인")
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var CommentsButton: UIButton = {
        let button = UIButton()
        button.setTitle("댓글", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.addAction(UIAction { _ in
            print("댓글 확인")
        }, for: .touchUpInside)
        return button
    }()
    
    
    // 클릭시 이용약관을 보여주는 페이지 시트로 이동하는 useButton
    private lazy var useButton: UIButton = {
        let button = UIButton()
        button.setTitle("이용약관", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        
        button.addAction(UIAction { _ in
            print("이용약관 학인")
            let viewController = TermsofUseViewController()
            viewController.modalPresentationStyle = .pageSheet
            
            self.present(viewController, animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    
    
    // 로그아웃 클릭 시 경고문과 함께 보여주는 logOutButton
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        
        button.addAction(UIAction { _ in
            
            let alert = UIAlertController(title: "로그아웃 확인",
                                          message: "현재 접속중인 계정에서 로그아웃 됩니다.",
                                          preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { _ in
                print("취소")
            })
            
            let logOutAction = UIAlertAction(title: "로그아웃", style: .destructive, handler: { _ in
                            self.navigationController?.popViewController(animated: false)
                            MainTabBarViewController.shared.selectedIndex = 0
                            MainTabBarViewController.shared.dismiss(animated: true)

                        })
            
            alert.addAction(logOutAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }, for: .touchUpInside)
        
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "Settings"
        
        buildInterface()
    }
    
    func buildInterface() {
        setupSubviews()
        setupConstraints()
    }
    
    
    // view의 하위요소를 설정하고 추가하고 UI요소들의 제약조건을 추가하는 setUpInterFace
    private func setupSubviews() {
        view.addSubview(vStackView)
        
        vStackView.addArrangedSubview(saveButton)
        vStackView.addArrangedSubview(CommentsButton)
        vStackView.addArrangedSubview(useButton)
        vStackView.addArrangedSubview(logOutButton)
    }
    
    // UI요소들의 레이아웃 제약조건을 설정하는 setupConstraints
    private func setupConstraints() {
        // view.safeAreaLayoutGuide을 담아내는 변수 safeGuide
        let safeGuide = view.safeAreaLayoutGuide
        
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStackView.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor),

            vStackView.widthAnchor.constraint(equalToConstant: 350),
            
            useButton.heightAnchor.constraint(equalToConstant: 50),
            logOutButton.heightAnchor.constraint(equalToConstant: 50),

            vStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            useButton.heightAnchor.constraint(equalToConstant: 50),
            logOutButton.heightAnchor.constraint(equalToConstant: 50),
            CommentsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

#Preview {
    SettingViewController()
}

