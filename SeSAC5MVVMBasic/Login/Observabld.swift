//
//  Observabld.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/9/24.
//

import Foundation

class Observable<T> {
    
var closure: (() -> Void)?
   
    var value: T {
        didSet {
            print("이건 실행이 되지 않을꺼다, 아직은 아무것도 들어가지 않아서")
            closure?()
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    //LoginViewController의
    //🌟
    func bind(closure: @escaping () -> Void) {
        closure()
        self.closure = closure
    }
    
}
