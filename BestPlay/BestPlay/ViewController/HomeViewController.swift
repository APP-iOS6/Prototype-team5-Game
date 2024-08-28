//
//  HomeViewController.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit
import Combine
import SafariServices

class HomeViewController: BaseViewController {
    //홈 뷰모델 인스턴스 생성
    private let viewModel: HomeViewModel = HomeViewModel()
    //컴바인 - 구독 취소를 위한 객체(메모리 누수 방지)
    private var subscriptions = Set<AnyCancellable>()
    
    //메인 vStack
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    //타이틀 라벨
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "최고의 플레이"
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    //장르를 선택할 수 있는 탭
    private lazy var genreTab: UIView = {
        //GenreTabBar를 호출하고 선택된 장르를 클로저로 받음
        let tab = GenreTabBar { genre in
            //장르가 바뀌었을 때
            self.viewModel.updateSelectedGenre(genre)
        }
        return tab.view
    }()
    
    
    //최고의 플레이 포스트 collectionView
    private lazy var postCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //세로 스크롤
        layout.minimumLineSpacing = 30 //포스트 간격
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind() //post 구독을 위해 호출하는 함수
    }
    
    //뷰모델의 post데이터를 구독을 진행하는 함수
    private func bind() {
        viewModel.$filterPost
            .receive(on: DispatchQueue.main) //main에서 데이터를 받게
            .sink { [weak self] _  in
                self?.postCollectionView.reloadData() //데이터가 바뀔 시 reloadData
            }
            .store(in: &subscriptions) //Set의 라이프사이클과 함께 구독 관리(메모리 누수 방지)
    }
    
    //인터페이스 설정
    override func setupInterface() {
        view.addSubview(mainVStack)
        mainVStack.addArrangedSubview(titleLabel)
        mainVStack.addArrangedSubview(genreTab)
        mainVStack.addArrangedSubview(postCollectionView)
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            //메인 vStack safeGuide의 전체화면으로 설정
            mainVStack.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            mainVStack.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            mainVStack.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            mainVStack.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            
            //타이틀 라벨 앵커
            titleLabel.topAnchor.constraint(equalTo: mainVStack.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor, constant: 10),
            
            //징르 탭바 앵커 -> 전체 화면 비율의 0.08만큼 높이만큼 차지
            genreTab.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            genreTab.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor),
            genreTab.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor),
            genreTab.heightAnchor.constraint(equalTo: mainVStack.heightAnchor, multiplier: 0.08),
            
            //포스트 컬렉션 뷰
            postCollectionView.topAnchor.constraint(equalTo: genreTab.bottomAnchor,constant: 10),
            postCollectionView.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: mainVStack.bottomAnchor)
        ])
    }
    
}



//컬렉션 뷰를 위한 extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //컬렉션 뷰의 아이템 개수를 정의
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filterPost.count
    }
    
    //각 셀을 정의
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //셀 재사용을 위함
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
            return UICollectionViewCell()
        }
        let post = viewModel.filterPost[indexPath.row] //인덱스로 데이터 가져오기
        cell.updateUi(post: post) {
            //좋아요 버튼 눌렀을 때 실행되는 클로저 -> 좋아요 업데이트
            self.viewModel.updateHeart(post.id, heart: post.myheart)
        } commentTap: {
            //댓글 아이콘 눌렀을 때 실행되는 클로저 -> 댓글 모달 페이지 보여줌
            let commentViewController = CommentViewController(comments: post.comment)
            commentViewController.modalPresentationStyle = .automatic
            self.present(commentViewController, animated: true)
        } thumbnailTap: {
            //포스트가 동영상 타입일 시 눌렀을 때 실행되는 클로저 -> 웹뷰 띄움
            if let url = URL(string: post.videoUrl ?? "") {
                let videoViewController = SFSafariViewController(url: url)
                videoViewController.modalPresentationStyle = .automatic
                self.present(videoViewController, animated: true, completion: nil)
            }
        }
        return cell
    }
    
    //각 셀의 높이를 지정하기 위함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*셀의 넓이 = 꽉차게, 높이 = 컬렉션뷰가 차지하고 있는 범위의 * 0.8
         indexPath를 통해 동영상, 사진 타입에 따라 높이를 다르게 설정해줘도 좋을 것 같음
         */
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height * 0.8
        return CGSize(width: width, height: height)
    }
    
}
