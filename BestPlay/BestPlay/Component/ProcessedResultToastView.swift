//
//  ProcessedResultToastView.swift
//  BestPlay
//
//  Created by 홍재민 on 8/29/24.
//

import UIKit

final class ProcessedResultToastView: BaseView {
    
    private lazy var comment: UILabel = {
        let view = UILabel()
        view.text = "처리 되었습니다"
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func setupLayout() {
        backgroundColor = .gray
        alpha = 0.5
        layer.cornerRadius = 8
    }
    
    override func setupInterface() {
        addSubview(comment)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 370),
            heightAnchor.constraint(equalToConstant: 30),
            
            comment.centerXAnchor.constraint(equalTo: centerXAnchor),
            comment.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setComment(_ text: String) {
        comment.text = text
    }
}

#Preview() {
    ProcessedResultToastView()
}
