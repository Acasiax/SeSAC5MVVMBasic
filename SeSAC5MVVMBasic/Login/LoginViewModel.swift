//
//  LoginViewModel.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/9/24.
//

import Foundation
//import UIKit

class LoginViewModel {
    
    //실시간으로 달라지는 데이터를 감지
    var inputId: Observable<String?> = Observable("")
    var inputPassword: Observable<String?> = Observable(nil)
    
    var outputValidationText = Observable("")
    var outputValid = Observable(false)
    
    
    init() {
        print("뷰 모델이 생성되었다.")
        inputId.bind {_ in 
            self.validation()
        }
        
        inputPassword.bind {_ in 
            self.validation()
        }
    }
    
    private func validation() {
        
        guard let id = inputId.value, let pw = inputPassword.value else {
            return
        }
        
        if id.count >= 3 && pw.count > 5 {
            print("유효성 통과")
            outputValid.value = true
            outputValidationText.value = "올바르게 잘 썼어요"
        } else {
            print("유효성 검증 오류")
            outputValid.value = false
            outputValidationText.value = "이메일 3자, 비번 5자 이상"
        }
    }
}

