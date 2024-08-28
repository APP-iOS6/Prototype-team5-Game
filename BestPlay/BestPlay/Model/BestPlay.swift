//
//  BestPlay.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit


struct BestPlay: Identifiable {
    var id: String = UUID().uuidString //고유 Id
    var userProfileImage: UIImage? //프로필 이미지
    var userName = ""   //유저 이름
    var createAt = Date() //날짜
    var thumNail: UIImage? //썸네일 이미지
    var isVideo: Bool = true //비디오 타입인지?
    var videoUrl: String?   //비디오 타입이라면 주소
    var text: String //본문
    var heart: Int //좋아요 수
    var comment: [Comment] //댓글 배열
    var myheart: Bool = false //내가 좋아요를 눌른 여부
    var genre: GameGenre //게임 장라ㅡ
}


struct Comment:Identifiable {
    var id: String = UUID().uuidString //고유 Id
    var userProfileImage: UIImage? //유저 프로필
    var userName: String //유저 이름
    var createAt = Date() //생성 시기
    var text: String //본문
}
