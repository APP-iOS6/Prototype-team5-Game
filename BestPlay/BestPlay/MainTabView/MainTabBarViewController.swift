//
//  MainTabBarViewController.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit


class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private lazy var home: BaseViewController = {
        let vc = HomeViewController()
        vc.tabBarItem =  UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        return vc
    }()
    
    private lazy var posting: BaseViewController = {
        let vc = CommunityUploadViewController()
        vc.tabBarItem = UITabBarItem(title: "포스팅", image: UIImage(systemName: "plus.circle.fill"), tag: 1)
        return vc
    }()
    
    private lazy var profile: UIViewController = {
        let vc = MyPageViewController()
        vc.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        return vc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = .systemBackground
        self.viewControllers = [home, posting, profile]
    }
    
}
