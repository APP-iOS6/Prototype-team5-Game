//
//  CommentTableViewCell.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    static let identifier = "CommentTableViewCell"
    
    private lazy var mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private lazy var userProfileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = nil
        image.layer.cornerRadius = 60 / 2
        return image
    }()
    
    private lazy var userVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dateText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var moreTextBnt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "더보기"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInterface() {
        contentView.addSubview(userProfileImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(commentLabel)
        contentView.addSubview(moreTextBnt)
        contentView.addSubview(dateText)
        NSLayoutConstraint.activate([
            //유저 프로필 이미지 앵커
            userProfileImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            userProfileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            userProfileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 60),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 60),
            
            //유저 이름 앵커
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 10),
            
            //댓글 라벨 앵커
            commentLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 6),
            commentLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            
            //더보기 텍스트 앵커
            moreTextBnt.leadingAnchor.constraint(equalTo: commentLabel.trailingAnchor,constant: 25),
            moreTextBnt.bottomAnchor.constraint(equalTo: commentLabel.bottomAnchor),
            
            //시간 텍스트 앵커
            dateText.leadingAnchor.constraint(equalTo: userNameLabel.trailingAnchor, constant: 10),
            dateText.topAnchor.constraint(equalTo: userNameLabel.topAnchor),
            dateText.bottomAnchor.constraint(equalTo: userNameLabel.bottomAnchor)
        ])
      
      
    }
    

    
    func updateUI(_ comment: Comment) {
        userProfileImageView.image = comment.userProfileImage
        userNameLabel.text = comment.userName
        commentLabel.text = comment.text
        dateText.text = comment.createAt.formattedTimeAgo
    }
    
}
