//
//  MainTabBarViewController.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit


class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    static let shared: MainTabBarViewController = MainTabBarViewController()
    
    let loginVC = LoginViewController()
    
    private var prevSelectedViewController: UIViewController? = nil
    private let loginWarningAlert = UIAlertController(title: "로그인이 필요한 기능입니다.", message: "로그인으로 이동하시겠습니까?", preferredStyle: .alert)
    private lazy var loginAction = UIAlertAction(title: "로그인", style: .default) { [weak self] _ in
        AuthenticationManager.shared.setLoggedinTrue()
        
        self?.dismiss(animated: false)
//        let loginVC = LoginViewController()
        let navigationController = UINavigationController(rootViewController: self?.loginVC ?? LoginViewController())
        navigationController.modalPresentationStyle = .fullScreen
        self?.present(navigationController, animated: true)
    }
    private let cancelAction = UIAlertAction(title: "취소", style: .cancel)
    
    private(set) lazy var home: HomeViewController = {
        let vc = HomeViewController()
        vc.tabBarItem =  UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        return vc
    }()
    
    private lazy var posting: BaseViewController = {
        let vc = CommunityUploadViewController()
        vc.tabBarItem = UITabBarItem(title: "포스팅", image: UIImage(systemName: "plus.circle.fill"), tag: 1)
        return vc
    }()
    
    private lazy var profile: UINavigationController = {
        let myPageViewController = MyPageViewController()
        let myPageNavigationController = UINavigationController(rootViewController: myPageViewController)
        
        
        myPageViewController.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        
        return myPageNavigationController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = .systemBackground
        self.viewControllers = [home, posting, profile]
        
        loginWarningAlert.addAction(loginAction)
        loginWarningAlert.addAction(cancelAction)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        prevSelectedViewController = tabBarController.selectedViewController
        
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if AuthenticationManager.shared.loggedin == false {
            present(loginWarningAlert, animated: true)
            self.selectedViewController = prevSelectedViewController
        }
    }
}
