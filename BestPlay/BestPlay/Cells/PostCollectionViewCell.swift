//
//  PostCollectionViewCell.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"
    
    private var thumbnailTapAction: (() -> Void)?
    //포스트 vStack
    private lazy var postVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        //stack.spacing = 10
        return stack
    }()
    
    //헤더 hStack
    private lazy var headerHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    
    //헤더 이름, 이름아래 시간대 vStack
    private lazy var headerVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        return stack
    }()
    
    //유저 프로필 이미지 뷰
    private lazy var userProfileImageVIew: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = nil
        return image
    }()
    
    //유저이름 라벨
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    //생성 시간대 라벨
    private lazy var createAtLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    //more버튼
    private lazy var moreBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return btn
    }()
    
    //썸네일 이미지뷰
    private lazy var playThumnailImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = nil
        return image
    }()
    
    private lazy var emptyView: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 0, height: 10)
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var postText: UILabel = {
        let label = UILabel()
        return label
    }()
    
    //푸터
    private lazy var footerHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var heartLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        return label
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "doc.text"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInterface() {
        contentView.addSubview(postVStack)
        
        postVStack.addArrangedSubview(headerHStack)
        
        headerHStack.addArrangedSubview(userProfileImageVIew)
        headerHStack.addArrangedSubview(headerVStack)
        headerHStack.addArrangedSubview(moreBtn)
        
        headerVStack.addArrangedSubview(userNameLabel)
        headerVStack.addArrangedSubview(createAtLabel)
        
        postVStack.addArrangedSubview(emptyView)
        postVStack.addArrangedSubview(playThumnailImage)
        postVStack.addArrangedSubview(footerHStack)
        postVStack.addArrangedSubview(postText)
        
        
        footerHStack.addArrangedSubview(heartButton)
        footerHStack.addArrangedSubview(heartLabel)
        footerHStack.addArrangedSubview(commentButton)
        footerHStack.addArrangedSubview(commentLabel)
        
        NSLayoutConstraint.activate([
            //postVStack
            postVStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postVStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postVStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            postVStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //유저 이미지 뷰 넓이 높이 앵커
            userProfileImageVIew.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            userProfileImageVIew.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            
            
            
            
            //헤더 HStack 리딩, 트레일링 앵커
            headerHStack.leadingAnchor.constraint(equalTo: postVStack.leadingAnchor, constant: 10),
            headerHStack.trailingAnchor.constraint(equalTo: postVStack.trailingAnchor, constant: -10),
            
            moreBtn.trailingAnchor.constraint(equalTo: headerHStack.trailingAnchor),
            moreBtn.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            moreBtn.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            
            //썸네일 이미지 리딩, 트레일링 및 높이 앵커
            playThumnailImage.topAnchor.constraint(equalTo: headerHStack.bottomAnchor, constant: 16),
            playThumnailImage.leadingAnchor.constraint(equalTo: postVStack.leadingAnchor),
            playThumnailImage.trailingAnchor.constraint(equalTo: postVStack.trailingAnchor),
            playThumnailImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            //컨텐트 뷰의 0.7 비율만큼 차지
            
            postText.leadingAnchor.constraint(equalTo: postVStack.leadingAnchor, constant: 15),
            postText.trailingAnchor.constraint(equalTo: postVStack.trailingAnchor, constant: -15),
            
            //푸터 HStack 리딩, 트레일링 앵커
            footerHStack.leadingAnchor.constraint(equalTo: postVStack.leadingAnchor),
            footerHStack.trailingAnchor.constraint(equalTo: postVStack.trailingAnchor),
            
            //하트버튼
            heartButton.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            heartButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            heartButton.leadingAnchor.constraint(equalTo: footerHStack.leadingAnchor, constant: 5),
            commentButton.leadingAnchor.constraint(equalTo: heartLabel.trailingAnchor, constant: 15),
            commentButton.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            commentButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            
        ])
        
    }
    
    func updateUi(
        post: BestPlay,
        heartTap:@escaping () -> Void,
        commentTap: @escaping () -> Void,
        thumbnailTap: @escaping () -> Void
    ) {
        userProfileImageVIew.image = post.userProfileImage //유저 프로필
        userNameLabel.text = post.userName  //유저 이름
        createAtLabel.text = post.createAt.formattedDay + post.createAt.formattedTime //날짜
        playThumnailImage.image = post.thumNail //썸네일
        heartLabel.text = String(post.heart) //하트갯수
        postText.text = post.text
        
        commentLabel.text = "\(post.comment.count)" //댓글 개수
        
        heartButton.removeTarget(nil, action: nil, for: .allEvents) //하트버튼 이벤트 다 제거 이거 안하면 막 꼬임
        heartButton.addAction(UIAction{_ in heartTap()}, for: .touchUpInside) //액션
        if post.myheart { //좋아요를 눌렀다면 빨강 하트
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)//하트버튼
            heartButton.tintColor = .red
        } else {
            //그게 아니라면 검은색 빈 하트
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal) //하트버튼
            heartButton.tintColor = .black
        }
        
        commentButton.removeTarget(nil, action: nil, for: .allEvents)
        commentButton.addAction(UIAction{ _ in commentTap() }, for: .touchUpInside)
        
        //썸네일 이미지 제스처 다 제거
        playThumnailImage.gestureRecognizers?.forEach(playThumnailImage.removeGestureRecognizer)
        
        if post.isVideo { //post가 비디오 타입이면 웹 뷰 띄움
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(thumbnailTapped))
            playThumnailImage.addGestureRecognizer(tapGesture)
            playThumnailImage.isUserInteractionEnabled = true // 사용자 상호작용 활성화
        }
        
        userProfileImageVIew.layer.cornerRadius = contentView.frame.height * 0.1 / 2
        self.thumbnailTapAction = thumbnailTap //self.썸네일 액션을 클로저로
    }
    
    @objc private func thumbnailTapped() {
        thumbnailTapAction?() // 클릭되면 위 updateUI 클로저 실행
    }
}
