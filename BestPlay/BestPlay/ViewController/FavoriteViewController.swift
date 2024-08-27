//
//  FavoritViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/27/24.
//

import UIKit

class FavoriteGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // 모델 인스턴스 생성
    private let model = FavoriteGameModel()
    
    private var selectedGenre: String? // 선택된 장르
    private var selectedGame: String?  // 선택된 게임 이름
    
    // UI 요소들 정의
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "장르 선택" // 장르 선택 레이블
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var genrePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "게임 이름 선택" // 게임 이름 선택 레이블
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var gameNamePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("건너뛰기", for: .normal) // 건너뛰기 버튼
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음", for: .normal) // 다음 버튼
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        // 스택뷰에 UI 요소들을 세로로 배치
        let stackView = UIStackView(arrangedSubviews: [genreLabel, genrePicker, gameNameLabel, gameNamePicker, skipButton, nextButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 뷰가 로드될 때 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupInterface() // UI 설정
    }
    
    // UI 요소들을 뷰에 추가하고 레이아웃 설정
    private func setupInterface() {
        view.addSubview(stackView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50) // 다음 버튼의 높이 설정
        ])
        
        // 게임 이름 선택기와 다음 버튼 사이에 공간 추가
        stackView.setCustomSpacing(20, after: gameNamePicker)
    }
    
    // 건너뛰기 버튼 액션
    @objc private func handleSkip() {
        print("건너뛰기 버튼 눌림")
    }
    
    // 다음 버튼 액션
    @objc private func handleNext() {
        print("다음 버튼 눌림")
    }
    
    // UIPickerViewDataSource와 UIPickerViewDelegate 메서드들
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genrePicker {
            return model.genres.count // 장르 수 반환
        } else if pickerView == gameNamePicker {
            guard let selectedGenre = selectedGenre else { return 0 }
            return model.getGames(for: selectedGenre).count // 선택된 장르의 게임 수 반환
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genrePicker {
            return model.genres[row] // 장르 이름 반환
        } else if pickerView == gameNamePicker {
            guard let selectedGenre = selectedGenre else { return nil }
            return model.getGames(for: selectedGenre)[row] // 선택된 장르의 게임 이름 반환
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == genrePicker {
            selectedGenre = model.genres[row] // 선택된 장르 업데이트
            gameNamePicker.reloadAllComponents() // 게임 선택기 갱신
        } else if pickerView == gameNamePicker {
            selectedGame = model.getGames(for: selectedGenre ?? "")[row] // 선택된 게임 업데이트
        }
    }
}

#Preview {
    FavoriteGameViewController()
}
