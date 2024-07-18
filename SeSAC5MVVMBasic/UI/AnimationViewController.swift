//
//  AnimationViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/15/24.
//

import UIKit

class AnimationViewController: UIViewController {

    private let logoImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(systemName: "star.circle.fill")
         imageView.contentMode = .scaleAspectFit
         imageView.tintColor = .systemYellow
         return imageView
     }()
     
     private let emailTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "이메일"
         textField.keyboardType = .emailAddress
         textField.autocapitalizationType = .none
         return textField
     }()
     
     private let passwordTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "비밀번호"
         textField.isSecureTextEntry = true
         return textField
     }()
     
     private let loginButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("로그인", for: .normal)
         button.backgroundColor = .systemPurple
         button.setTitleColor(.white, for: .normal)
         button.layer.cornerRadius = 5
         return button
     }()
     
     private let signUpLabel: UILabel = {
         let label = UILabel()
         label.text = "계정이 없으신가요? 회원가입"
         label.textColor = .systemBlue
         label.backgroundColor = .white
         label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 14)
         return label
     }()
  
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
        //애니메이션 전에 초기 상태
        loginButton.alpha = 0
        signUpLabel.alpha = 0
        logoImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
       // logoImageView.alpha = 0
        emailTextField.alpha = 0
        passwordTextField.alpha = 0
        
        animationImageView()
        
        
    }
    
   
    func animationImageView() {
           UIView.animate(withDuration: 1) {
               self.logoImageView.transform = CGAffineTransform(rotationAngle: 200)
           } completion: { _ in
               self.animationEmailTextField()
           }
       }
       
       func animationEmailTextField() {
           UIView.animate(withDuration: 0.5) {
               self.emailTextField.alpha = 1
           } completion: { _ in
               self.animationPasswordTextField()
           }
       }
       
       func animationPasswordTextField() {
           UIView.animate(withDuration: 0.5) {
               self.passwordTextField.alpha = 1
           } completion: { _ in
               self.animationLoginButton()
           }
       }
       
       func animationsignUpLabel() {
           UIView.animate(withDuration: 0.5) {
               self.signUpLabel.alpha = 1
           }
       }
       
       func animationLoginButton() {
           UIView.animate(withDuration: 0.5) {
               self.loginButton.alpha = 1
           } completion: { _ in
               self.animationsignUpLabel()
           }
       }
    
    
    private func setupViews() {
            view.backgroundColor = .white
            
            [logoImageView, emailTextField, passwordTextField, loginButton, signUpLabel].forEach { view.addSubview($0) }
            
            logoImageView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
                make.width.height.equalTo(100)
            }
            
            emailTextField.snp.makeConstraints { make in
                make.top.equalTo(logoImageView.snp.bottom).offset(50)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(44)
            }
            
            passwordTextField.snp.makeConstraints { make in
                make.top.equalTo(emailTextField.snp.bottom).offset(20)
                make.left.right.height.equalTo(emailTextField)
            }
            
            loginButton.snp.makeConstraints { make in
                make.top.equalTo(passwordTextField.snp.bottom).offset(30)
                make.left.right.equalTo(emailTextField)
                make.height.equalTo(44)
            }
            
            signUpLabel.snp.makeConstraints { make in
                make.top.equalTo(loginButton.snp.bottom).offset(20)
                make.centerX.equalToSuperview()
            }
        }
}


//1. 프로토콜 자체는 dynamic인가요, static인가요?
//
//프로토콜 자체는 정적(static)입니다. 즉, 프로토콜은 컴파일 시점에 확인되며, 타입 정보도 정적입니다. 다만, 프로토콜을 채택한 객체는 동적으로 동작할 수 있습니다. 예를 들어, 프로토콜을 사용하여 다형성을 구현할 수 있는데, 이는 런타임에 동적으로 동작하는 부분입니다.


//
//2. AnyObject를 채택하면 왜 클래스 제약이 가능한가요? Any와 AnyObject의 차이점을 알려주세요.
//
// AnyObject는 클래스 타입만을 허용하는 프로토콜입니다. 그래서 AnyObject를 채택하면 해당 타입은 반드시 클래스여야 하므로 클래스 제약이 가능합니다. 반면, Any는 클래스, 구조체, 열거형 등 모든 타입을 허용합니다. 요약하면:
//
//Any: 모든 타입을 포함합니다. (클래스, 구조체, 열거형, 함수 등)
//AnyObject: 클래스 타입만 포함합니다.



//3. 확장 자체는 dynamic인가요, static한가요?
//
//확장(extension) 자체는 정적(static)입니다. 즉, 컴파일 시점에 확장이 이루어집니다. 하지만 확장의 내용에 따라 동적으로 동작할 수도 있습니다. 예를 들어, 확장에서 추가된 메소드가 런타임에 호출될 때 동적으로 동작할 수 있습니다.
