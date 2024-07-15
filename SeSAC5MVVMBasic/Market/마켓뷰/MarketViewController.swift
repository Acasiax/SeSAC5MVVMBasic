//
//  MarketViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/10/24.
//

import UIKit
import SnapKit

class MarketViewController: UIViewController {
  
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "마겟 검색"
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
   let viewModel = MarketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationItems()
        bindData()
    }
    
    func  bindData() {
        viewModel.inputViewDidLoadTrigger.value = ()
        
        viewModel.outputMarketData.bind { market in
//            self.navigationItem.title = market.first?.korean_name
//            self.searchBar.text = market.first?.english_name
            self.tableView.reloadData()
        }
        
        viewModel.outputTitleData.bind { value in
            self.navigationItem.title = value
        }
        
        viewModel.outputCellSelected.bind{ data in
           print("1")
            
            guard let data = data else {
                print("nil이라서 화면 전환 되면 안됨!")
                return
            }
            
            let vc = MarketDetailViewController()
            vc.viewModel.outputMarketData.value = data
            self.navigationController?.pushViewController(vc, animated: true)
            print("2")
        }
       
    }
    
    private func setupUI() {
        view.backgroundColor = .white
       // view.addSubview(searchBar)
        view.addSubview(tableView)
        
//        searchBar.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.left.right.equalToSuperview()
//        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.top.equalTo(searchBar.snp.bottom)
//            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationItems() {
        navigationItem.title = "마켓 목록"
       
    }
    
}

extension MarketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputMarketData.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let data = viewModel.outputMarketData.value[indexPath.row]
        cell.textLabel?.text = "\(data.korean_name) | \(data.english_name)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let data = viewModel.outputMarketData.value[indexPath.row]
        //   viewModel.inputCellSelected.value = data
        
//        let vc = MarketDetailViewController()
//        navigationController?.pushViewController(vc, animated: true)
        
        let data = viewModel.outputMarketData.value[indexPath.row]
        viewModel.inputCellSelected.value = data
        
     
        
    }
    
}

extension MarketViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }
}
