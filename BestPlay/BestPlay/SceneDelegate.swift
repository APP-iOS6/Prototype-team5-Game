//
//  SceneDelegate.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBar: UITabBarController = UITabBarController()
        let home = ViewController()
        let posting = ViewController()
        let profile = ViewController()
        
        tabBar.setViewControllers([home, posting, profile], animated: false)
        
        home.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        posting.tabBarItem = UITabBarItem(title: "포스팅", image: UIImage(systemName: "plus.circle.fill"), tag: 1)
        profile.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .systemBackground
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
      
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}

