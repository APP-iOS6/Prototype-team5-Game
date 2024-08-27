//
//  BestPlay.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit


struct BestPlay: Identifiable {
    var id: String = UUID().uuidString
    var userProfileImage: UIImage? //프로필 이미지
    var userName = ""   //유저 이름
    var createAt = Date() //날짜
    var thumNail: UIImage? //썸네일 이미지
    var isVideo: Bool = true
    var videoUrl: String?
    var text: String
    var heart: Int
    var comment: [Comment]
    var myheart: Bool = false
    var genre: GameGenre
}


struct Comment:Identifiable {
    var id: String = UUID().uuidString
    var userProfileImage: UIImage?
    var userName: String
    var createAt = Date()
    var text: String
}
