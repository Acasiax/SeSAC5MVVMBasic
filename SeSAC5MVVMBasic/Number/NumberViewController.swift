//
//  NumberViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by jack on 7/9/24.
//

import UIKit
import SnapKit

class NumberViewController: UIViewController {

    private let amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "금액 입력"
        textField.keyboardType = .numberPad
        return textField
    }()

    private let formattedAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "₩0"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private let convertedAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
   let viewModel = NumberViewModel()
 
    func showAlert() {
        let open = UIAlertAction(title: "확인", style: .default)
        let delete = UIAlertAction(title: "삭제", style: .destructive)
        let cancle = UIAlertAction(title: "취소", style: .cancel)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //6주차 보충자료에 있음.
        UIAlertAction(title: "ok", style: .default) {_ in
            self.formattedAmountLabel.text = "dfdsf"
        }
        
        configureUI()
        configureConstraints()
        configureActions()
        bindData()
    }
    
    func bindData() {
        viewModel.outputAmount.bind {  value in
            self.formattedAmountLabel.text = value
        }
        showAlert()
    }
    

    // MARK: - configure Methods
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(amountTextField)
        view.addSubview(formattedAmountLabel)
        view.addSubview(convertedAmountLabel)
    }

    private func configureConstraints() {
        amountTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }

        formattedAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(amountTextField.snp.bottom).offset(20)
            make.left.right.equalTo(amountTextField)
        }

        convertedAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(formattedAmountLabel.snp.bottom).offset(20)
            make.left.right.equalTo(amountTextField)
        }
    }

    private func configureActions() {
        amountTextField.addTarget(self, action: #selector(amountChanged), for: .editingChanged)
    }
 
    
    @objc func amountChanged() {
        print(#function, viewModel.outputAmount)
        viewModel.inputAmount.value = amountTextField.text
    }
    
    
}
