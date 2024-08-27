//
//  SettingViewController.swift
//  BestPlay
//
//  Created by Min on 8/27/24.
//

import UIKit
// 설정 페이지 완성
class SettingViewController: UIViewController {
    
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var useButton: UIButton = {
        let button = UIButton()
        button.setTitle("이용약관", for: .normal)
        button.backgroundColor = .systemGray
        
        button.addAction(UIAction { _ in
            print("이용약관 학인")
            let viewController = TermsofUseViewController()
            viewController.modalPresentationStyle = .pageSheet
            
            self.present(viewController, animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .systemGray
        
        
        button.addAction(UIAction { _ in
            
            let alert = UIAlertController(title: "정말 로그아웃 하시겠습니까?",
                                          message: "다시 로그인하면 됩니다.",
                                          preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { _ in
                print("취소")
            })
            
            let logOutAction = UIAlertAction(title: "로그아웃", style: .destructive, handler: { _ in
                print("로그아웃")
                self.navigationController?.popViewController(animated: true)
                
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
        
        setUpInterFace()
    }

    func setUpInterFace() {
        
        let safeGuide = view.safeAreaLayoutGuide
        
        view.addSubview(vStackView)
        vStackView.addArrangedSubview(useButton)
        vStackView.addArrangedSubview(logOutButton)
        
        
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
