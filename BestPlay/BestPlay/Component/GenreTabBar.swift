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
        scroll.contentSize = CGSize(width: GameGenre.allCases.count * 100, height: 0)
        scroll.backgroundColor = .systemBackground
        return scroll
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func setupInterface() {
        view.addSubview(scrollView)
        
        
        for (index, genre) in GameGenre.allCases.enumerated() {
            let genreBtn = createGenre(genre)
            genreBtn.frame = CGRect(x: index * 100 + 10, y: 0, width: 80, height: 50)
            scrollView.addSubview(genreBtn)
        }
    
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
    GenreTabBar(actionTap: { genre in
        print("\(genre.rawValue)")
    })
}
