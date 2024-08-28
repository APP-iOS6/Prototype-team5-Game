//
//  BaseHorizontalStackViewController.swift
//  BestPlay
//
//  Created by 홍재민 on 8/27/24.
//

import UIKit

class BaseHorizontalStackViewController: BaseViewController {

    let horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupInterface() {
        super.setupInterface()
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            horizontalStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            horizontalStackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            horizontalStackView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            horizontalStackView.heightAnchor.constraint(equalTo: safeArea.heightAnchor)
        ])
    }
}
