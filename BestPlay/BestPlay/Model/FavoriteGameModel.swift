//
//  FavoriteGameModel.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/27/24.
//

import Foundation

struct FavoriteGameModel {
    let genres: [String]
    let games: [String: [String]]
    
    // 선택된 게임을 저장하는 속성
    var selectedGames: [String] = []

    init() {
        // 장르와 게임 목록 데이터 초기화
        genres = ["RPG", "FPS", "스포츠", "아케이드"]
        games = [
            "RPG": ["메이플스토리", "던전앤파이터", "바람의나라", "아키에이지", "디아블로4", "리니지", "리니지 2", "검은사막", "로스트아크", "월드 오브 워크래프트"],
            "FPS": ["오버워치2", "서든어택", "배틀그라운드", "배틀필드", "콜 오브 듀티: 워존", "레인보우 식스 시즈", "카운터 스트라이크: 글로벌 오펜시브"],
            "스포츠": ["피파", "프리스타일2", "프리스타일 풋볼", "위닝 일레븐 (eFootball)", "NBA 2K", "MLB 더 쇼"],
            "아케이드": ["철권", "펌프잇업", "킹 오브 파이터즈", "스트리트 파이터", "보글보글", "갤러그", "버추어 파이터"],
            "리듬": ["DJMAX", "펌프 잇 업", "사이터스", "디모", "유비트", "비트매니아", "테크니카"],
            "퍼즐": ["캔디 크러쉬 사가", "테트리스", "애니팡", "2048", "젤리팡", "비쥬얼드", "프루트 닌자"]
        ]
        
    }

    func getGames(for genre: String) -> [String] {
        return games[genre] ?? []
    }

    mutating func toggleGameSelection(_ game: String) {
        if let index = selectedGames.firstIndex(of: game) {
            selectedGames.remove(at: index)
        } else {
            selectedGames.append(game)
        }
    }
}
