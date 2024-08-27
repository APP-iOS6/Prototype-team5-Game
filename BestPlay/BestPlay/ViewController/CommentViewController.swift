//
//  CommentViewController.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class CommentViewController: BaseViewController {

    var comments: [Comment]
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
  
    
    private lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .black
        btn.addAction(UIAction {_ in
            self.dismiss(animated: true)
        }, for: .touchUpInside)
        return btn
    }()
    
    private lazy var commentTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupInterface() {
        super.setupInterface()
        view.addSubview(mainVStack)
            
       
        mainVStack.addArrangedSubview(closeBtn)
        mainVStack.addArrangedSubview(commentTableView)
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            mainVStack.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            mainVStack.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            mainVStack.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            
            closeBtn.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor, constant: -15),
            closeBtn.topAnchor.constraint(equalTo: mainVStack.topAnchor, constant: 10),
            commentTableView.topAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant: 15),
            commentTableView.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor),
            commentTableView.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor),
            commentTableView.bottomAnchor.constraint(equalTo: mainVStack.bottomAnchor)
           
        ])
    }
    
    
    init(comments: [Comment]) {
        self.comments = comments
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}


extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell else {
                return UITableViewCell()
            }
        let comment = self.comments[indexPath.row]
        
        return cell
    }
    
    
}
