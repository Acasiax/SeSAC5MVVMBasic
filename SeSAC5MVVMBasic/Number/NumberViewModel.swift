//
//  NumberViewModel.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/9/24.
//

import Foundation

class NumberViewModel {
    private var exchangeRate = 1300.0
   
    var inputAmount: String? = "" {
        didSet {
            print("값이 변함: \(inputAmount)")
            validation(inputAmount)
        }
    }
    
    var outputAmount = ""
    
    private func validation(_ value: String?){
        print(#function)
        
        //1.
        guard let text = value else {
            outputAmount = ""
            return
        }
        
        
        //2.
        if text.isEmpty {
            outputAmount = "값을 입력해주세요"
            return
           
        }
        
        
        //3.
        guard let num = Int(text) else {
            outputAmount =  "숫자만 입력해주세요"
            return
        }
        
        //4.
        if num > 0, num <= 10000000 {
            
            let format = NumberFormatter()
            format.numberStyle = .decimal
            let wonResult = format.string(from: num as NSNumber)!
          outputAmount = "$" + wonResult
           
            
            
//            let converted = Double(num) / exchangeRate
//            
//            let convertedFormat = NumberFormatter()
//            convertedFormat.numberStyle = .currency
//            convertedFormat.currencyCode = "USF" //원화기호을 붙여주지도 않았는데도 되는이유
//            let converedResult = convertedFormat.string(from: converted as NSNumber)
//            convertedAmountLabel.text = converedResult //원화기호을 붙여주지도 않았는데도 되는이유
            
        } else {
            outputAmount = "천만원 이하를 입력해주세요"

        }
       
    }
    
}
