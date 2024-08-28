//
//  BaseVerticalStackViewController.swift
//  BestPlay
//
//  Created by 홍재민 on 8/27/24.
//

import UIKit

class BaseVerticalStackViewController: BaseViewController {
    
    let verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 10
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupInterface() {
        super.setupInterface()
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
        ]) // 높이는 동적으로 설정됨
    }
}
