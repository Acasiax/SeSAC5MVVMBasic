//
//  LoginViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by jack on 7/9/24.
//
 
import UIKit
import SnapKit

class LoginViewController: UIViewController {
 
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()

    private let validationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "유효성 레이블"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//       //인스턴스 생성 시에는 didset 실행이 안됨. 그래서 억지로 호출.
//        let jack = Observable(name: "잭")
//        
//        jack.bind {
//            print("하이루")
//        }
//        
//        //이거 여기에 넣어야 그 이후에 변화를 감지함?  jack.name = "브랜",jack.name = "덴" 위에 배치해야함
//        jack.closure = {
//            print("안녕 반가워")
//        }
//        
//        
//        jack.closure?() //얘를 직접 호출안해도 실행할 수 있는 방법은? 그래서 changeName(value: () -> Void) 만들었음
//        
//        jack.value = "브랜"
//        
//    
     //   jack.value = "덴"
       
   
        configureUI()
        configureConstraints()
        configureActions()
        bindData()
    }

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(validationLabel)
        view.addSubview(loginButton)
    }
    
    func bindData() {
        
        viewModel.outputValidationText.bind { value in
            self.validationLabel.text = value
        }
        
        
      
        
        viewModel.outputValid.bind { value in
            self.validationLabel.textColor = value ? .blue : .red
            self.loginButton.backgroundColor = value ? .systemGreen : .gray
            self.loginButton.isEnabled = value
        }
        
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

    private func configureActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc private func loginButtonTapped() {
        print(#function)
    }

    @objc private func textFieldDidChange() {
        print(#function)
        viewModel.inputId.value = idTextField.text
        viewModel.inputPassword.value = passwordTextField.text
    
    }
}
