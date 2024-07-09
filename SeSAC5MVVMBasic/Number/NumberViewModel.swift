//
//  NumberViewModel.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/9/24.
//

import Foundation

class NumberViewModel {
    private var exchangeRate = 1300.0
   
    var inputAmount: Observable<String?> = Observable("")
    var outputAmount = Observable("")
    
    init() {
        inputAmount.bind {  value in
            self.validation()
        }
        
    }
    
    private func validation(){
        print(#function)
        
        //1.
        guard let text = inputAmount.value else {
            outputAmount.value = ""
            return
        }
        
        
        //2.
        if text.isEmpty {
            outputAmount.value = "값을 입력해주세요"
            return
           
        }
        
        
        //3.
        guard let num = Int(text) else {
            outputAmount.value =  "숫자만 입력해주세요"
            return
        }
        
        //4.
        if num > 0, num <= 10000000 {
            
            let format = NumberFormatter()
            format.numberStyle = .decimal
            let wonResult = format.string(from: num as NSNumber)!
            outputAmount.value = "$" + wonResult
           
            
            
//            let converted = Double(num) / exchangeRate
//            
//            let convertedFormat = NumberFormatter()
//            convertedFormat.numberStyle = .currency
//            convertedFormat.currencyCode = "USF" //원화기호을 붙여주지도 않았는데도 되는이유
//            let converedResult = convertedFormat.string(from: converted as NSNumber)
//            convertedAmountLabel.text = converedResult //원화기호을 붙여주지도 않았는데도 되는이유
            
        } else {
            outputAmount.value = "천만원 이하를 입력해주세요"

        }
       
    }
    
}
