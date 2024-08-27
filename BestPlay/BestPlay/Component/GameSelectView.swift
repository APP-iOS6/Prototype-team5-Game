//
//  GameSelectView.swift
//  BestPlay
//
//  Created by 홍재민 on 8/27/24.
//

import UIKit

final class GameSelectView: BaseView {
    
    private let dummyGameData: [Game] = [
        Game(name: "Overwatch", thumbnail: UIImage(named: "Overwatch")!),
        Game(name: "BattleGround", thumbnail: UIImage(named: "BattleGround")!),
        Game(name: "Minecraft", thumbnail: UIImage(named: "Minecraft")!)
    ]
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.alignment = .leading
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func setupInterface() {
        for data in dummyGameData {
            let imageView = createImageView(image: data.thumbnail)
            
            horizontalStackView.addArrangedSubview(imageView)
        }
        
        addSubview(horizontalStackView)
    }
    
    private func createImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        let imageViewSize = 80.0
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageViewSize / 2
        imageView.layer.borderWidth = 2.5
        imageView.layer.borderColor = UIColor.cyan.cgColor
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: imageViewSize),
            imageView.heightAnchor.constraint(equalToConstant: imageViewSize)
        ])
        
        return imageView
    }
}


#Preview() {
    GameSelectView()
}
