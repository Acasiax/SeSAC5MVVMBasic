//
//  BoxOfficeViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by jack on 7/15/24.
//
 
import Foundation
import UIKit
import SnapKit

class BoxOfficeViewController: UIViewController {
    
    private let viewModel = BoxOfficeViewModel()
      
    
    //지연 저장 프로퍼티
    private lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "3"
        textField.borderStyle = .roundedRect
        textField.inputView = datePicker
        return textField
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        return picker
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("검색", for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.dataSource = self
        return tableView
    }()
      
    deinit{
        print("BoxOfficeViewController deinit")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureConstraints()
        bindViewModel()
    } 
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(dateTextField)
        view.addSubview(searchButton)
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(searchButton.snp.left).offset(-10)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(dateTextField)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(60)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        viewModel.outputSelectedDate.bind { [weak self] date in
            self?.dateTextField.text = date
        }
        
        viewModel.outputList.bind { [weak self]  _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
           
           // viewModel.
            
        }
        
        
    }
    
    @objc private func datePickerValueChanged() {
        print(datePicker.date)
        viewModel.inputSelectedDate.value = datePicker.date
        
       
    }
    
    @objc private func searchButtonTapped() {
        // 검색 버튼이 탭되었을 때의 동작 구현
        viewModel.inputSearchButtonTapped.value = ()
    }
}

extension BoxOfficeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        let data = viewModel.outputList.value[indexPath.row]
        cell.textLabel?.text = "\(data.rank), \(data.movieNm) (관객수: \(data.audiCnt)"
        return cell
    }
}
 
