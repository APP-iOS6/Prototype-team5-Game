//
//  BestPlayData.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

//더미 데이터
let PostData: [BestPlay] = [
    
    BestPlay(userProfileImage: UIImage(named: "anaprofile"), userName: "아나장인 홍재민", thumNail: UIImage(named: "ana1"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=PlB8zNEGTnY", text: "갓재민 아나 하이라이트", heart: 999, comment: [
        Comment(userProfileImage: UIImage(named: "user1"),userName: "대정원",createAt: fiveMinutesAgo, text: "개잘한다;;"),
        Comment(userProfileImage: UIImage(named: "user3"),userName: "헬종혁", createAt: thirtyMinutesAgo, text: "쫌 하시네요\n저랑 같이 ㄱㄱ"),
        Comment(userProfileImage: UIImage(named: "user2"),userName: "페페", createAt: oneHourAgo, text: "갓재민@@"),
        Comment(userProfileImage: UIImage(named: "user5"),userName: "신 현우", createAt: yesterday, text: "신")
    ],
             myheart: true, genre: [.fps,.popular]),
    
    BestPlay(userProfileImage: UIImage(named: "ganjiprofile"), userName: "학살 이정민",createAt: fiveMinutesAgo, thumNail: UIImage(named: "genji1"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=4a65BV5rUuk", text: "겐지 용검 하이라이트", heart: 229, comment: [],myheart: true, genre: [.fps, .best]),
    
    
    
    BestPlay(userProfileImage: UIImage(named: "winstonprofile"), userName: "동스턴 킴동경",createAt: thirtyMinutesAgo , thumNail: UIImage(named: "winston1"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=er6mV3HKZ-Y", text: "동스턴 ㄱ", heart: 142, comment: [],genre: [.fps, .best]),
    
    BestPlay(userProfileImage: UIImage(named: "jenyataprofile"), userName: "젠야타 고수 황인영",createAt: thirtyMinutesAgo , thumNail: UIImage(named: "jenyata1"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=E1eJ-GId7XI", text: "젠야타 폼 미쳤다", heart: 673, comment: [], genre: [.fps, .popular]),
    
    BestPlay(userProfileImage: UIImage(named: "mapleprofile"), userName: "신창섭", createAt: oneHourAgo, thumNail: UIImage(named: "maple"), isVideo: false, text: "메이플\n 정상화", heart: 521, comment: [], genre: [.rpg, .best]),
    
    BestPlay(userProfileImage: UIImage(named: "lostarkprofile"), userName: "빛강선", createAt: twoHourAgo, thumNail: UIImage(named: "lostark"), isVideo: false, text: "로아 카멘 더 퍼스트", heart: 214, comment: [], genre: [.rpg, .best]),
    
    BestPlay(userProfileImage: UIImage(named: "fifaprofile"), userName: "피파",
             createAt: yesterday,thumNail: UIImage(named: "fifa1"), isVideo: true, videoUrl: "https://www.youtube.com/watch?v=f5ipBPGv-lY", text: "토트넘 가보자", heart: 753, comment: [], genre: [.sport, .popular]),
    
    BestPlay(userProfileImage: UIImage(named: "nbaprofile"), userName: "NBA", createAt: oldday, thumNail: UIImage(named: "nba"), isVideo: false, text: "농구하고싶다", heart: 211, comment: [
        Comment(userProfileImage: UIImage(named: "user1"),userName: "대정원", text: "농구 한번 ㄱ"),
        Comment(userProfileImage: UIImage(named: "user3"),userName: "김동경", text: "대정원이랑 농구 하고 싶다"),
        Comment(userProfileImage: UIImage(named: "user4"),userName: "빵빵이", text: "옥지야!"),
        Comment(userProfileImage: UIImage(named: "user5"),userName: "갓준영", text: "국보급 센터"),
        Comment(userProfileImage: UIImage(named: "user2"),userName: "대종혁", text: "농구 = 근손실")
    ],
             genre: [.sport, .popular]),
]

//현재 시간
let now = Date()
//5 분전 시간
let fiveMinutesAgo = Calendar.current.date(byAdding: .minute, value: -5, to: now)!

let thirtyMinutesAgo = Calendar.current.date(byAdding: .minute, value: -30, to: now)!


// 1시간 전 시간
let oneHourAgo = Calendar.current.date(byAdding: .hour, value: -1, to: now)!

// 2시간 전 시간
let twoHourAgo = Calendar.current.date(byAdding: .hour, value: -1, to: now)!

// 어제의 날짜와 시간
let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: now)!

// 2일전 시간
let oldday = Calendar.current.date(byAdding: .day, value: -2, to: now)!

