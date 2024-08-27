//
//  MyPageViewController.swift
//  BestPlay
//
//  Created by Min on 8/27/24.
//

import UIKit

// 마이페이지 ViewController
class MyPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    
    private lazy var collectionVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "청개구리"
        label.font = .systemFont(ofSize: 25)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "12")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        imageView.layer.borderWidth = 2
        
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.text = "게시물 \n\(imageNames.count)"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19)
        return label
    }()
    
    private lazy var heartLabel: UILabel = {
        let label = UILabel()
        label.text = "좋아요 \n5"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19)
        return label
    }()
    
    private lazy var comentLabel: UILabel = {
        let label = UILabel()
        label.text = "댓글 \n0"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19)
        return label
    }()
    
    private lazy var settingButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "gearshape")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20)
        config.imagePlacement = .leading
        
        
        let button = UIButton(configuration: config)
        
        
        button.addAction(UIAction { _ in
            print("설정 진입")
            
            let viewController = SettingViewController()
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 6
        layout.minimumLineSpacing = 6
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    
    private let imageNames = (1...13).map { "\($0)" }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "프로필"
        view.backgroundColor = .systemBackground
        
        buildInterface()
    }
    
    func buildInterface() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(vStackView)
        view.addSubview(settingButton)
        
        vStackView.addArrangedSubview(hStackView)
        hStackView.addArrangedSubview(userImageView)
        hStackView.addArrangedSubview(postLabel)
        hStackView.addArrangedSubview(heartLabel)
        hStackView.addArrangedSubview(comentLabel)
        
        vStackView.addArrangedSubview(userNameLabel)
        vStackView.addArrangedSubview(collectionVStackView)
        collectionVStackView.addArrangedSubview(collectionView)
    }
    
    
    private func setupConstraints() {
        let safeGuide = view.safeAreaLayoutGuide
        
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionVStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            
            vStackView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 45),
            vStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 20),
            vStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20),
            
            
            
            userImageView.widthAnchor.constraint(equalToConstant: 90),
            userImageView.heightAnchor.constraint(equalToConstant: 90),
            
            
            collectionView.heightAnchor.constraint(equalToConstant: 400),
            
            settingButton.widthAnchor.constraint(equalToConstant: 40),
            settingButton.heightAnchor.constraint(equalToConstant: 40),
            settingButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20),
            settingButton.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: -20),
            
            
            collectionView.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor),
            
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = UIImageView(frame: cell.contentView.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: imageNames[indexPath.item])
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.bounds.width - 6 * 2) / 3
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("선택한 이미지 번호: \(imageNames[indexPath.item])")
    }
}


#Preview {
    MyPageViewController()
}
