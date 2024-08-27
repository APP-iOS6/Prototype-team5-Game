//
//  BasePostViewController.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class BasePostViewController: BaseViewController {

    lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: 500, height: 100)
        return scroll
    }()
    
    lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupInterface() {
        super.setupInterface()
        view.addSubview(vStack)
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(scrollView)
        scrollView.addSubview(hStack)
        
        for genre in GameGenre.allCases {
            let genreBtn = createGenre(genre.rawValue)
            hStack.addArrangedSubview(genreBtn)
        }
        
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor)
        ])
    }
    
    override func setupLayout() {
        super.setupLayout()
    }
    
    
    
    func createGenre(_ genre: String) -> UIButton  {
        let btn = UIButton()
        btn.setTitle(genre, for: .normal)
        
        return btn
    }
    //...였던것

}
