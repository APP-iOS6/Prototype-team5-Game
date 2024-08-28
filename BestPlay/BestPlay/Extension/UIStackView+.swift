//
//  UIStackView+.swift
//  BestPlay
//
//  Created by 홍재민 on 8/27/24.
//

import UIKit

extension UIStackView {
    
    /// Add views and set each view's translatesAutoresizingMaskIntoConstraints to false
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
