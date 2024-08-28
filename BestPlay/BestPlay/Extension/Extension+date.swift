//
//  Extension+date.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import Foundation

extension Date {
    
    // 시간 차이를 기준으로 "방금", "n분 전", "오늘", "M월 d일 E요일" 형식으로 반환하는 extension
        var formattedTimeAgo: String {
            let now = Date()
            let calendar = Calendar.current

            let components = calendar.dateComponents([.minute, .hour, .day], from: self, to: now)

            if let day = components.day, day > 0 {
                if day == 1 {
                    return "어제"
                } else {
                    let formatter = DateFormatter()
                    formatter.locale = Locale(identifier: "ko_KR")
                    formatter.dateFormat = "M월 d일 E요일"
                    return formatter.string(from: self)
                }
            } else if let hour = components.hour, hour > 0 {
                return "\(hour)시간 전"
            } else if let minute = components.minute, minute > 0 {
                return "\(minute)분 전"
            } else {
                return "방금"
            }
        }
    
    
    //오후 3시 25분 식으로 문자열 반환하기 위한 extension
    var formattedTime: String {
        let formatter = DateFormatter()  //데이터 포맷터
        formatter.locale = Locale(identifier: "ko_KR") //포맷터 지역 - 한국
        formatter.dateFormat = "a hh:mm"    //데이터 형식
        return formatter.string(from: self) //포맷터의 문자열 반환
    }
    
    //데이터 날짜가 오늘이면 "오늘" 아니면 날짜 문자열 리턴하기위한 extension
    var formattedDay: String {
        let now = Date() //현재 날짜
        let calendar = Calendar.current //캘린더를 현재로 설정
        
        let nowStartOfDay = calendar.startOfDay(for: now) //오늘날짜
        let dateStartOfDay = calendar.startOfDay(for: self) //포맷터 날짜
        
        //날짜가 얼마나 차이나는지
        let numOfDayDifference = calendar.dateComponents([.day], from: nowStartOfDay, to: dateStartOfDay).day
        
        if numOfDayDifference == 0 {
            return "오늘" //0이면 오늘임
        } else {
            //그게 아니라면 포맷해서 날짜 출력
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "M월 d일 E요일"
            return formatter.string(from: self)
        }
    }
}
