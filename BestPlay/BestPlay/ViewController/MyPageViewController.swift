//
//  MyPageViewController.swift
//  BestPlay
//
//  Created by Min on 8/27/24.
//

import UIKit

// 마이페이지 ViewController
class MyPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // view에 들어갈 vStackView
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .leading
        return stackView
    }()
    
    // userImageView, postLabel, heartLabel, comentLabel이 들어갈 hStackView
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    // collectionView의 위치를 잡아주는 collectionVStackView
    private lazy var collectionVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    // userImage랑 userName 사이의 구분선
    private lazy var userControlSeparator: UIView = {
        let uIView = UIView()
        uIView.backgroundColor = UIColor(red: 80/255, green: 90/255, blue: 55/255, alpha: 1.0)
        uIView.translatesAutoresizingMaskIntoConstraints = false
        return uIView
    }()
    
    // userName을 보여주는 Label
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "청개구리"
        label.font = .systemFont(ofSize: 20)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()
    
    // userImage를 보여주는 ImageVIew
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "0")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        imageView.layer.borderWidth = 2
        
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
//    // 프로필 편집 버튼
//    private lazy var userEditButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("프로필 편집", for: .normal)
//        button.backgroundColor = .gray
//        return button
//    }()
    
    
    
    // 올린 게시물 수 만큼 보여주는 postLabel
    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.text = "게시물 \n\(imageNames.count)"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19)
        return label
    }()
    
    // 좋아요를 받은 수 만큼 보여주는 Label
    private lazy var heartLabel: UILabel = {
        let label = UILabel()
        label.text = "좋아요 \n5"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19)
        return label
    }()
    
    // 자신이 댓글을 몇 개나 달았는지 보여주는 Label
    private lazy var comentLabel: UILabel = {
        let label = UILabel()
        label.text = "댓글 \n0"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19)
        return label
    }()
    
    // 설정 페이지로 들어가는 Button
    private lazy var settingButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.imageColorTransformer = .grayscale
        config.image = UIImage(systemName: "gearshape")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20)
        config.imagePlacement = .leading
        config.baseBackgroundColor = .gray
        
        
        // 버튼의 스타일을 바꾸는 코드
        let button = UIButton(configuration: config)
        
        button.addAction(UIAction { _ in
            print("설정 진입")
            
            let viewController = SettingViewController()
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    
    // 에셋에 저장되어 있는 이미지들을 보여주는 UICollectionView
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
    
    // 에셋에 저장되있는 사진을 문자열로 변환하여 배열로 바꾸는 변수
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
    
    // view의 하위요소를 설정하고 추가하는 setupConstraints
    private func setupSubviews() {
        view.addSubview(vStackView)
        view.addSubview(settingButton)
        
        vStackView.addArrangedSubview(hStackView)
        hStackView.addArrangedSubview(userImageView)
        hStackView.addArrangedSubview(postLabel)
        hStackView.addArrangedSubview(heartLabel)
        hStackView.addArrangedSubview(comentLabel)
        
        vStackView.addArrangedSubview(userControlSeparator)
        vStackView.addArrangedSubview(userNameLabel)
//        vStackView.addArrangedSubview(userEditButton)
        vStackView.addArrangedSubview(collectionVStackView)
        collectionVStackView.addArrangedSubview(collectionView)
    }
    
    // UI요소들의 레이아웃 제약조건을 설정하는 setupConstraints
    private func setupConstraints() {
        // view.safeAreaLayoutGuide을 담아내는 변수 safeGuide
        let safeGuide = view.safeAreaLayoutGuide
        
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionVStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 45),
            vStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 0),
            vStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: 0),
            
            hStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -30),
            
            userImageView.widthAnchor.constraint(equalToConstant: 90),
            userImageView.heightAnchor.constraint(equalToConstant: 90),
            
            collectionView.heightAnchor.constraint(equalToConstant: 395),
            collectionView.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor),
            
//            collectionVStackView.heightAnchor.constraint(equalToConstant: 390),
//            collectionVStackView.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor),
//            collectionVStackView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor),
            
            
            userControlSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userControlSeparator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            userControlSeparator.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 15),
            userControlSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            settingButton.widthAnchor.constraint(equalToConstant: 40),
            settingButton.heightAnchor.constraint(equalToConstant: 40),
            settingButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20),
            settingButton.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: -20),
            
            
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    
    // 콜렉셕 뷰의 섹션에서 몇 개의 아이템을 표시할지 반환하는 역할
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    // 콜렉션 뷰에서 특정 위치에 표시할 셀을 구성하고 반환하는 역할
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = UIImageView(frame: cell.contentView.bounds)
        imageView.contentMode = .scaleAspectFill
        //        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: imageNames[indexPath.item])
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    // 컬렉션 뷰에서 특정 위치에 있는 셀의 크기를 결정하는 역할
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.bounds.width - 6 * 2) / 3
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    // MARK: - UICollectionViewDelegate
    
    // 콜렉션 뷰의 이미지를 클릭했을 때 촐력하는 역할
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("선택한 이미지 번호: \(imageNames[indexPath.item])")
    }
}

#Preview {
    MyPageViewController()
}
