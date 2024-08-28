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
    
    // 장르 선택 레이블
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "장르 선택"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    // 장르 선택기 (UIPickerView)
    private lazy var genrePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    // 게임 이름 선택 레이블
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "게임 이름 선택"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    // 게임 이름 선택기 (UIPickerView)
    private lazy var gameNamePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    // 건너뛰기 버튼
    private lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("건너뛰기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        // 건너뛰기 버튼 클릭 시 탭바로 이동하는 액션 설정
        button.addAction(UIAction { _ in
            let tabBarViewController = MainTabBarViewController()
            tabBarViewController.modalPresentationStyle = .fullScreen
            self.present(tabBarViewController, animated: true)
        }, for: .touchUpInside)
        return button
    }()
    
    // 다음 버튼
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        // 다음 버튼 클릭 시 탭바로 이동하는 액션 설정
        button.addAction(UIAction { _ in
            let tabBarViewController = MainTabBarViewController()
            tabBarViewController.modalPresentationStyle = .fullScreen
            self.present(tabBarViewController, animated: true)
        }, for: .touchUpInside)
        return button
    }()
    
    // UI 요소들을 포함하는 스택뷰 정의
    private lazy var stackView: UIStackView = {
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
        title = "관심 게임 설정"
        setupInterface() // UI 설정
        
        // 초기 선택값 설정: 첫 번째 장르를 기본 선택으로 설정
        if let firstGenre = model.genres.first {
            selectedGenre = firstGenre
            genrePicker.selectRow(0, inComponent: 0, animated: false)
            gameNamePicker.reloadAllComponents()
        }
    }
    
    // UI 요소들을 뷰에 추가하고 레이아웃 설정
    private func setupInterface() {
        view.addSubview(stackView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            // 스택뷰의 레이아웃 설정
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
    
    // UIPickerView 컴포넌트 수 반환
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerView 각 컴포넌트 내의 항목 수 반환
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genrePicker {
            return model.genres.count // 장르 수 반환
        } else if pickerView == gameNamePicker {
            guard let selectedGenre = selectedGenre else { return 0 }
            return model.getGames(for: selectedGenre).count // 선택된 장르의 게임 수 반환
        }
        return 0
    }
    
    // UIPickerView 각 행에 표시할 제목 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genrePicker {
            return model.genres[row] // 장르 이름 반환
        } else if pickerView == gameNamePicker {
            guard let selectedGenre = selectedGenre else { return nil }
            return model.getGames(for: selectedGenre)[row] // 선택된 장르의 게임 이름 반환
        }
        return nil
    }
    
    // UIPickerView에서 항목 선택 시 호출
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
