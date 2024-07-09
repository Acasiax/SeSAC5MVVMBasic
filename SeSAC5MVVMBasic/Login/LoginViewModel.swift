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
    var inputId: String? = "" {
        didSet {
            validation()
        }
    }
    
    
    var inputPassword: String? = "" {
        didSet {
            validation()
        }
        
    }
    
    var outputValidationText = Observable("")
    var outputValid = Observable(false)
    
    
    private func validation() {
        
        guard let id = inputId, let pw = inputPassword else {
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
