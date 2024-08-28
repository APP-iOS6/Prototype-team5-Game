//
//  CommunityViewController.swift
//  BestPlay
//
//  Created by 홍재민 on 8/27/24.
//

import UIKit

final class CommunityUploadViewController: BaseVerticalStackViewController, UITextViewDelegate {
    
    private lazy var topItemStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 15
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "글 올리기"
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
        view.text = textViewPlaceHolder
        view.textColor = .lightGray
        view.textAlignment = .left
        view.delegate = self
        
        return view
    }()
    private let textViewPlaceHolder: String = "글을 입력하세요"
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
        
        topItemStackView.addArrangedSubviews(titleLabel, gameSelectView)

        verticalStackView.addArrangedSubviews(topItemStackView, contentSelectButton, textEditView)
        view.addSubview(verticalStackView)
        view.addSubview(uploadButton)
        
        NSLayoutConstraint.activate([
            uploadButton.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            uploadButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -10),
            uploadButton.widthAnchor.constraint(equalToConstant: 150),
            
            topItemStackView.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            topItemStackView.bottomAnchor.constraint(equalTo: gameSelectView.bottomAnchor),
            topItemStackView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 10),
            topItemStackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -10),
            
            contentSelectButton.topAnchor.constraint(equalTo: topItemStackView.bottomAnchor, constant: 10),
            contentSelectButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            contentSelectButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            
            textEditView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
        ])
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let trimResult = textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimResult.isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }
}

#Preview() {
    CommunityUploadViewController()
}
