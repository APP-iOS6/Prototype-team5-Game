//
//  HomeViewModel.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import Combine
import Foundation

//홈 뷰모델
final class HomeViewModel {
    //전체 아이템 리스트
    @Published var postList: [BestPlay] = []
    //필터 아이템 리스트(화면에 보여줄 아이템 리스트)
    @Published var filterPost: [BestPlay] = []
    
    //현재 선택된 장르
    private var selectedGenre: GameGenre = .all
    private var selectedId: String = ""
    
    init() {
        postList = PostData //미리 서넝ㄴ해둔 더미 데이터
        filterPost = postList //처음 앱 진입 시 모든 데이터를 보여줄 것
    }
    
    //현재 선택된 장르를 업데이트하는 함수
    func updateSelectedGenre(_ genre: GameGenre) {
        selectedGenre = genre
        filterPostsBySelectedGenre()
    }
    
    func updateHeart(_ id: String, heart: Bool) {
        //좋아요를 누른 게시물의 id와 같은 데이터를 찾은 후
        if let index = postList.firstIndex(where: { $0.id == id }) {
            if heart {
                //만약 좋아요가 눌러져 있는 상태라면 취소하고 하트 개수 -1
                postList[index].heart -= 1
                postList[index].myheart = false
            } else {
                //그게 아니라면 좋아요 처리 및 하트 + 1
                postList[index].heart += 1
                postList[index].myheart = true
            }
            
            filterPostsBySelectedGenre()
        }
    }
    
    //화면 업데이트 하게끔 하는 함수
    private func filterPostsBySelectedGenre() {
        if selectedGenre == .all {
            filterPost = postList
        } else {
            filterPost = postList.filter { $0.genre.contains(selectedGenre) }
        }
    }
    
    
    //현재 선택된 포스트의 id를 변경하는 함수
    func updateSelectedId(_ id: String) {
        self.selectedId = id
    }
    
    //차단하기 버튼이 눌려 포스트를 삭제하는 함수
    func blockPost() {
        if let index = postList.firstIndex(where: { $0.id == self.selectedId
        }) {
            self.postList.remove(at: index)
            filterPostsBySelectedGenre()
        }
    }
}
