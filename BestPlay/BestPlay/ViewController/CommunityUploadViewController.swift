//
//  CommunityViewController.swift
//  BestPlay
//
//  Created by 홍재민 on 8/27/24.
//

import UIKit

final class CommunityUploadViewController: BaseVerticalStackViewController {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "커뮤니티 업로드"
        view.font = .systemFont(ofSize: 30, weight: .bold)
        
        return view
    }()
    private let gameSelectView = GameSelectView()
    private lazy var imagePicker: UIImagePickerController = {
        let view = UIImagePickerController()
        
        view.sourceType = .photoLibrary
        
        return view
    }()
    private lazy var contentSelectButton: UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        
        config.image = UIImage(systemName: "icloud.and.arrow.up.fill")
        config.baseBackgroundColor = .lightGray
        
        view.configuration = config
        view.addAction(UIAction { [weak self] _ in
            self?.present(self!.imagePicker, animated: true)
        }, for: .touchUpInside)
        
        return view
    }()
    private lazy var textEditView: UITextView = {
        let view = UITextView()
        
        view.font = .preferredFont(forTextStyle: .title2)
        view.isEditable = true
        view.textAlignment = .left
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.gray.cgColor
        
        return view
    }()
    private lazy var uploadButton: UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        
        config.title = "업로드"
        
        view.configuration = config
        view.addAction(UIAction { _ in
            print("upload select!")
        }, for: .touchUpInside)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupInterface() {
        super.setupInterface()
        
        let safeArea = view.safeAreaLayoutGuide
        
        verticalStackView.alignment = .leading
        verticalStackView.spacing = 20
        verticalStackView.addArrangedSubviews(titleLabel, gameSelectView, contentSelectButton, textEditView, uploadButton)
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            gameSelectView.heightAnchor.constraint(equalToConstant: 80),
            
            contentSelectButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            contentSelectButton.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: -350),
            
            textEditView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            uploadButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            uploadButton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: -55),
            uploadButton.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor),
            uploadButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 50)
        ])
    }
}

#Preview() {
    CommunityUploadViewController()
}
