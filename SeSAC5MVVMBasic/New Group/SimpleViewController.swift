//
//  SimpleViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/18/24.
//

import UIKit
import SnapKit


/*
 UITableViewDelegate, UITableViewDataSource
 iOS13+
 */

class SimpleViewController: UIViewController {

    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SimpleCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
       
    }
    

}


extension SimpleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell")!
        
        var content = cell.defaultContentConfiguration()
        content.text = "aaaa"
        content.secondaryText = "343434"
        content.textProperties.color = .systemGreen
        content.image = UIImage(systemName: "star")
        content.imageProperties.tintColor = .red
        content.imageToTextPadding = 30
        cell.contentConfiguration = content
      
        return cell
    }
    
    
}

// ReusableView 프로토콜 정의
protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

// 프로토콜 기본 구현 제공
extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
