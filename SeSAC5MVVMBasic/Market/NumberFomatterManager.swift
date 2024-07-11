//
//  NumberFomatterManager.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/10/24.
//

import Foundation

class NumberFomatterManager {
    
    static let shared = NumberFomatterManager()
    
    private init() {}
    
    static let numberFormatter = {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        return format.string(from: 1000)
    }()
    
    static let today = {
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        return format.string(from: Date())
    }
}
