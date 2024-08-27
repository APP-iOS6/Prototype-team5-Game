//
//  BestPlayData.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit


let PostData: [BestPlay] = [
    
    BestPlay(userProfileImage: UIImage(named: "anaprofile"), userName: "아나장인 홍재민", thumNail: UIImage(named: "ana"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=PlB8zNEGTnY", text: "갓재민 아나 하이라이트", heart: 999, comment: [
        Comment(userProfileImage: UIImage(named: "user1"),userName: "대정원", text: "개잘한다;;"),
        Comment(userProfileImage: UIImage(named: "user2"),userName: "헬종혁", text: "쫌 하시네요"),
        Comment(userProfileImage: UIImage(named: "user3"),userName: "페페", text: "갓재민@@"),
        Comment(userProfileImage: UIImage(named: "user5"),userName: "신 현우", text: "신")
    ],
             myheart: true, genre: .fps),
    
    BestPlay(userProfileImage: UIImage(named: "ganjiprofile"), userName: "학살 이정민", thumNail: UIImage(named: "genji"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=4a65BV5rUuk", text: "겐지 용검 하이라이트", heart: 229, comment: [],myheart: true, genre: .fps),
    
    
    
    BestPlay(userProfileImage: UIImage(named: "winstonprofile"), userName: "동스턴 킴동경", thumNail: UIImage(named: "winston"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=er6mV3HKZ-Y", text: "동스턴 ㄱ", heart: 142, comment: [],genre: .fps),
    
    BestPlay(userProfileImage: UIImage(named: "jenyataprofile"), userName: "젠야타 고수 황인영", thumNail: UIImage(named: "jenyata"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=E1eJ-GId7XI", text: "젠야타 폼 미쳤다", heart: 673, comment: [], genre: .fps),
    
    BestPlay(userProfileImage: UIImage(named: "mapleprofile"), userName: "신창섭", thumNail: UIImage(named: "maple"), isVideo: false, text: "메이플\n 정상화", heart: 521, comment: [], genre: .rpg),
    
    BestPlay(userProfileImage: UIImage(named: "lostarkprofile"), userName: "빛강선", thumNail: UIImage(named: "lostark"), isVideo: false, text: "로아 카멘 더 퍼스트", heart: 214, comment: [], genre: .rpg),
    
    BestPlay(userProfileImage: UIImage(named: "fifaprofile"), userName: "피파", thumNail: UIImage(named: "fifa"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=f5ipBPGv-lY", text: "토트넘 가보자", heart: 753, comment: [], genre: .sport),
    
    BestPlay(userProfileImage: UIImage(named: "nbaprofile"), userName: "NBA", thumNail: UIImage(named: "nba"), isVideo: false, text: "농구하고싶다", heart: 211, comment: [
        Comment(userProfileImage: UIImage(named: "user1"),userName: "대정원", text: "농구 한번 ㄱ"),
        Comment(userProfileImage: UIImage(named: "user3"),userName: "김동경", text: "대정원이랑 농구 하고 싶다"),
        Comment(userProfileImage: UIImage(named: "user4"),userName: "빵빵이", text: "옥지야!"),
        Comment(userProfileImage: UIImage(named: "user5"),userName: "갓준영", text: "국보급 센터"),
        Comment(userProfileImage: UIImage(named: "user2"),userName: "대종혁", text: "농구 = 근손실")
    ],
             genre: .sport),
]
