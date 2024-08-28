//
//  BaseView.swift
//  BestPlay
//
//  Created by 홍재민 on 8/27/24.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInterface()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInterface() {
        
    }
    
    func setupLayout() {
        
    }
}
