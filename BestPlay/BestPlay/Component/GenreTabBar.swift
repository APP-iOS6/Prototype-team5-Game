//
//  GenreTabBar.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class GenreTabBar: BaseViewController {
    
    
    var actionTap: (GameGenre) -> Void
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: 500, height: 100)
        scroll.backgroundColor = .cyan
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
        view.addSubview(scrollView)
        scrollView.addSubview(hStack)
        
        for genre in GameGenre.allCases {
            let genreBtn = createGenre(genre)
            
            scrollView.addSubview(genreBtn)
        }
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 100),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            hStack.heightAnchor.constraint(equalToConstant: 100),
            hStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    
    
    func createGenre(_ genre: GameGenre) -> UIButton  {
        let btn = UIButton()
        btn.setTitle(genre.rawValue, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addAction(UIAction { _ in
            self.actionTap(genre)
        }, for: .touchUpInside)
        return btn
    }
    
    init(actionTap: @escaping (GameGenre) -> Void) {
        self.actionTap = actionTap
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 

}

#Preview {
    GenreTabBar(actionTap: { _ in
        print("??")
    })
}
