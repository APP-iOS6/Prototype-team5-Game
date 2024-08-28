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

    init() {
        // 장르와 게임 목록 데이터 초기화
        genres = ["RPG", "FPS", "스포츠", "아케이드"]
        games = [
            "RPG": ["메이플스토리", "던전앤파이터", "바람의나라", "아키에이지", "디아블로4"],
            "FPS": ["오버워치2", "서든어택", "배틀그라운드", "배틀필드"],
            "스포츠": ["피파", "프리스타일2", "프리스타일 풋볼"],
            "아케이드": ["철권", "펌프잇업", "킹 오브 파이터즈"],
        ]
    }

    func getGames(for genre: String) -> [String] {
        return games[genre] ?? []
    }
}
