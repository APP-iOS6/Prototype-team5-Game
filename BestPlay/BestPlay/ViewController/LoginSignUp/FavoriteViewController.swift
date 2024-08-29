//
//  FavoritViewController.swift
//  BestPlay
//
//  Created by Hwang_Inyoung on 8/27/24.
//

import UIKit

class FavoriteGameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // 모델 인스턴스 생성
    private var model = FavoriteGameModel()
    
    private var selectedGenre: String? // 선택된 장르
    private var selectedGames: Set<String> = [] // 선택된 게임들

    // UI 요소들 정의
    
    // 장르 선택 레이블 및 UIPickerView
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "장르 선택"
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
    
    // 게임 이름 테이블뷰
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(GameSelectionCell.self, forCellReuseIdentifier: "GameSelectionCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // 건너뛰기 버튼
    private lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("건너뛰기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
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
        button.addAction(UIAction { _ in
            let tabBarViewController = MainTabBarViewController.shared
            tabBarViewController.modalPresentationStyle = .fullScreen
            self.present(tabBarViewController, animated: true)
        }, for: .touchUpInside)
        return button
    }()
    
    // UI 요소들을 포함하는 스택뷰 정의
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [genreLabel, genrePicker, tableView, skipButton, nextButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "관심 게임 설정"
        setupInterface() // UI 설정
        
        // 초기 선택값 설정: 첫 번째 장르를 기본 선택으로 설정
        if let firstGenre = model.genres.first {
            selectedGenre = firstGenre
            genrePicker.selectRow(0, inComponent: 0, animated: false)
            tableView.reloadData()
        }
    }
    
    private func setupInterface() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            // 스택뷰의 레이아웃 설정
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            // 테이블뷰 높이 설정
            tableView.heightAnchor.constraint(equalToConstant: 320),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // UIPickerViewDataSource와 UIPickerViewDelegate 메서드들
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.genres[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGenre = model.genres[row]
        tableView.reloadData() // 장르가 변경되면 게임 목록을 갱신
    }
    
    // UITableViewDataSource와 UITableViewDelegate 메서드들
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let genre = selectedGenre else { return 0 }
        return model.getGames(for: genre).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameSelectionCell", for: indexPath) as? GameSelectionCell else {
            return UITableViewCell()
        }
        
        if let genre = selectedGenre {
            let game = model.getGames(for: genre)[indexPath.row]
            cell.nameLabel.text = game
            cell.checkBox.isSelected = selectedGames.contains(game)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let genre = selectedGenre else { return }
        let game = model.getGames(for: genre)[indexPath.row]
        
        if selectedGames.contains(game) {
            selectedGames.remove(game)
        } else {
            selectedGames.insert(game)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}


#Preview {
    FavoriteGameViewController()
}
