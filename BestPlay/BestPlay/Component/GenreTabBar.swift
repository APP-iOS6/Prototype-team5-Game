//
//  GenreTabBar.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class GenreTabBar: BaseViewController {
    
    //선택된 장르
    private var selectedGenre: GameGenre = .all {
        //선택된 장르가 바뀔 때마다 실행이 됨
        didSet {
            //업데이트 장르 해주는 함수
            updateSelectedGenre()
        }
    }
    //장르 버튼들 배열
    private var genreBtns: [UIButton] = []
    
    //호출할 때 쓰일 클로저(장르를 전달함)
    var actionTap: (GameGenre) -> Void
    
    //장르들을 담을 스크롤 뷰
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        //장르 수에 따라 가로 스크롤의 값이 바뀌게 설정
        scroll.contentSize = CGSize(width: GameGenre.allCases.count * 100, height: 0)
        scroll.backgroundColor = .systemBackground
        return scroll
    }()
    
    //init -> 장르가 바뀔 때마다 값을 내보내줄 클로저
    init(actionTap: @escaping (GameGenre) -> Void) {
        self.actionTap = actionTap
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //인터페이스 설정
    override func setupInterface() {
        view.addSubview(scrollView)
        
        //enum으로 설정한 장르의 모든 케이스를 반복문으로 추가
        for (index, genre) in GameGenre.allCases.enumerated() {
            let genreBtn = createGenre(genre)
            //장르 버튼의 위치 잡아주는 로직
            genreBtn.frame = CGRect(x: index * 100 + 10, y: 0, width: 80, height: 50)
            scrollView.addSubview(genreBtn)
        }
        
        //스크롤 뷰 높이, 넓이 설정
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
    }
    
    
    //장르 버튼을 생성하는 함수
    func createGenre(_ genre: GameGenre) -> UIButton  {
        let btn = UIButton()
        //버튼 타이틀
        btn.setTitle(genre.rawValue, for: .normal)
        
        //처음 생성시 all이 선택되게끔 all버튼만 파란색으로 설정
        genre == .all ? btn.setTitleColor(.blue, for: .normal) :  btn.setTitleColor(.black, for: .normal)
        
        //장르버튼들 배열에 추가
        genreBtns.append(btn)
        
        //장르 버튼 액션 추가 ->
        btn.addAction(UIAction { _ in
            self.actionTap(genre) //클로저로 장르 값 전달
            self.selectedGenre = genre //현재 선택된 장르 업데이트
        }, for: .touchUpInside)
        return btn
    }
    
    //선택된 장르가 바뀌었을 때 실행되는 함수
    func updateSelectedGenre() {
        for button in genreBtns {
            if button.titleLabel?.text == selectedGenre.rawValue {
                button.setTitleColor(.blue, for: .normal) // 선택된 버튼을 파란색으로 설정
            } else {
                button.setTitleColor(.black, for: .normal) // 선택되지 않은 버튼은 검은색으로 설정
            }
        }
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
