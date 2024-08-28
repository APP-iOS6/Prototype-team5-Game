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
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = nil
        image.layer.cornerRadius = 70 / 2 - 10
        return image
    }()
    
    private lazy var userVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        contentView.addSubview(mainHStack)
        userVStack.addArrangedSubview(userNameLabel)
        userVStack.addArrangedSubview(commentLabel)
        
        mainHStack.addArrangedSubview(userProfileImageView)
        mainHStack.addArrangedSubview(userVStack)
        
        NSLayoutConstraint.activate([
            mainHStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            userProfileImageView.leadingAnchor.constraint(equalTo: mainHStack.leadingAnchor, constant: 12),
            userProfileImageView.topAnchor.constraint(equalTo: mainHStack.topAnchor, constant: 12),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 70),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 70),
            userProfileImageView.bottomAnchor.constraint(equalTo: mainHStack.bottomAnchor,constant: -12),
            userVStack.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 12),
            userVStack.topAnchor.constraint(equalTo: userProfileImageView.topAnchor),
        ])
      
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    func updateUI(_ comment: Comment) {
        userProfileImageView.image = comment.userProfileImage
        userNameLabel.text = comment.userName
        commentLabel.text = comment.text
    }
    
}
