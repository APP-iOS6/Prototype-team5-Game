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
            self.viewModel.updateSelectedGenre(genre)
        }
        return tab.view
    }()
    
    //글 collectionView
    private lazy var postCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        viewModel.$filterPost
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _  in
                self?.postCollectionView.reloadData()
            }
            .store(in: &subscriptions)
    }
    
    override func setupInterface() {
        view.addSubview(mainVStack)
        mainVStack.addArrangedSubview(titleLabel)
        mainVStack.addArrangedSubview(genreTab)
        mainVStack.addArrangedSubview(postCollectionView)
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            mainVStack.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            mainVStack.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            mainVStack.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: mainVStack.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor, constant: 10),
            genreTab.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            genreTab.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor),
            genreTab.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor),
            genreTab.heightAnchor.constraint(equalTo: mainVStack.heightAnchor, multiplier: 0.08),
            postCollectionView.topAnchor.constraint(equalTo: genreTab.bottomAnchor,constant: 10),
            postCollectionView.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: mainVStack.bottomAnchor)
        ])
    }
    
}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filterPost.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
            return UICollectionViewCell()
        }
        let post = viewModel.filterPost[indexPath.row]
        cell.updateUi(post: post) {
            self.viewModel.updateHeart(post.id, heart: post.myheart)
        } commentTap: {
            let commentViewController = CommentViewController(comments: post.comment)
            commentViewController.modalPresentationStyle = .automatic
            self.present(commentViewController, animated: true)
        } thumbnailTap: {
            if let url = URL(string: post.videoUrl ?? "") {
                let videoViewController = SFSafariViewController(url: url)
                videoViewController.modalPresentationStyle = .automatic
                self.present(videoViewController, animated: true, completion: nil)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height * 0.8
        return CGSize(width: width, height: height)
    }
    
}
