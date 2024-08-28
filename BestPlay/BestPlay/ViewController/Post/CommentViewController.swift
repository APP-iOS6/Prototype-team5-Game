//
//  CommentViewController.swift
//  BestPlay
//
//  Created by 김동경 on 2024/08/27.
//

import UIKit

class CommentViewController: BaseViewController {

    //외부에서 전달받을 댓글 내용들
    var comments: [Comment]
    
    //메인 vStack
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
  
    private lazy var headerHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        return stack
    }()
    
    //닫기 버튼
    private lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .black
        btn.addAction(UIAction {_ in
            self.dismiss(animated: true)
        }, for: .touchUpInside)
        return btn
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.text = "댓글"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    //댓글 테이블 뷰
    private lazy var commentTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        
        table.separatorStyle = .none
        table.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //인터페이스 설정
    override func setupInterface() {
        super.setupInterface()
        view.addSubview(mainVStack)
            
        headerHStack.addArrangedSubview(commentLabel)
        headerHStack.addArrangedSubview(closeBtn)
        
       
        mainVStack.addArrangedSubview(headerHStack)
        mainVStack.addArrangedSubview(commentTableView)
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            //메인 vStack safeGuide 전체화면으로 설정
            mainVStack.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            mainVStack.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            mainVStack.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            mainVStack.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            
            
            headerHStack.topAnchor.constraint(equalTo: mainVStack.topAnchor),
            headerHStack.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor,constant: 10),
            headerHStack.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor, constant: -10),
            
            
            
            //댓글창 닫기버튼 앵커 위치 수정 필요
     
            closeBtn.widthAnchor.constraint(equalToConstant: 50),
            closeBtn.heightAnchor.constraint(equalToConstant: 50),
            
            //댓글 테이블 뷰 앵커
            commentTableView.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor),
            commentTableView.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor),
            commentTableView.bottomAnchor.constraint(equalTo: mainVStack.bottomAnchor)
           
        ])
    }
    
    
    //외부에서 호출할 때 댓글 배열을 받게
    init(comments: [Comment]) {
        self.comments = comments
        super.init(nibName: nil, bundle: nil)
    }
    
    //init실패 시 실행되는 함수
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//댓글 테이블 뷰 extension
extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
    //섹션에 row의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.comments.count
    }
    
    //각 셀을 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀 재사용 및 커스템 셀 호출
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell else {
                return UITableViewCell()
            }
        //데이터 가져와서
        let comment = self.comments[indexPath.row]
        cell.updateUI(comment) //데이터 전달(화면 업데이트)
        
        return cell
    }
}
