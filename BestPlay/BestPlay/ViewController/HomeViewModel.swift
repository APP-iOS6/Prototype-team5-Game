//
//  HomeViewModel.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import Foundation
import Combine

final class HomeViewModel {
    
    @Published var postList: [BestPlay] = []
    @Published var filterPost: [BestPlay] = []
    
    
    private var selectedGenre: GameGenre = .all
    
    
    init() {
        postList = PostData
        filterPost = postList
    }
    
    
    func updateSelectedGenre(_ genre: GameGenre) {
        selectedGenre = genre
        filterPostsBySelectedGenre()
    }
    
    func updateHeart(_ id: String, heart: Bool) {
        if let index = postList.firstIndex(where: { $0.id == id }) {
            if heart {
                postList[index].heart -= 1
                postList[index].myheart = false
            } else {
                postList[index].heart += 1
                postList[index].myheart = true
            }
            filterPostsBySelectedGenre()
        }
    }
    
    private func filterPostsBySelectedGenre() {
        if selectedGenre == .all {
            filterPost = postList
        } else {
            filterPost = postList.filter { $0.genre == selectedGenre }
        }
    }
}
