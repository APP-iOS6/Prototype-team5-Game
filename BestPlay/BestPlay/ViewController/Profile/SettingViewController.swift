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
        stackView.spacing = 40
        return stackView
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
                                          message: "정말로 로그아웃하시겠습니까? 로그아웃 시 현재 작업 중인 데이터가 저장되지 않을 수 있습니다.",
                                          preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { _ in
                print("취소")
            })
            
            let logOutAction = UIAlertAction(title: "로그아웃", style: .destructive, handler: { _ in
                print("로그아웃")
                
                let login = LoginViewController()
                login.modalPresentationStyle = .fullScreen
                self.present(login, animated: true)
                
                // 위에 self.navigationControll?를 삭제하고 밑의 주석을 풀면 로그아웃 버튼을 누르면 loginViewController로 넘어간다
//                if let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") {
//                    self.navigationController?.setViewControllers([loginViewController], animated: true)
//                }
                
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
            vStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            vStackView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}

#Preview {
    SettingViewController()
}
