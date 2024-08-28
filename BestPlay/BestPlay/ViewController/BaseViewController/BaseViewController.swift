//
//  BaseViewController.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupInterface()
        setupLayout()
    }
    
    func setupInterface() {
        
    }
    
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
