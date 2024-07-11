//
//  SampleViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/11/24.
//

import UIKit

class SampleViewController: UIViewController {
//    
//    private lazy var idTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "아이디"
//        textField.borderStyle = .roundedRect
//        textField.autocapitalizationType = .none
//        return textField
//    }()
    
    //함수랑 같은 기능을 한다.
    private lazy var idTextField: UITextField = { (ph) -> UITextField in
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        return textField
    }("ad")
    
    
//    func makeIdTextField(ph: String) -> UITextField {
//        let textField = UITextField()
//        textField.placeholder = "아이디"
//        textField.borderStyle = .roundedRect
//        textField.autocapitalizationType = .none
//        return textField
//    }
    

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()

    private let validationLabel: UILabel = {
        let label = UILabel()
        label.text = "유효성 레이블"
        label.numberOfLines = 0
        return label
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    
    func test(a: Int, jack: (String, Int) -> Void) {
        func sample( ph: String, number: Int) {
               let b = 2
               idTextField.text = "\(ph),\(b + number)"
        }
        sample(ph: "고래밥", number: 8)
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
//        
//        test(a: 8, jack: { ph, number in
//            let b = 2
//            idTextField.text = "\(ph),\(b)"
//        })
        
        test(a: 8) { ph, number in
            let b = 2
            idTextField.text = "\(ph),\(b)"
        }
        
    }
    
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(validationLabel)
        view.addSubview(loginButton)
    }
    
    
    private func configureConstraints() {
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(20)
            make.left.right.height.equalTo(idTextField)
        }

        validationLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.left.right.equalTo(idTextField)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(validationLabel.snp.bottom).offset(30)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(50)
        }
    }
    
}
