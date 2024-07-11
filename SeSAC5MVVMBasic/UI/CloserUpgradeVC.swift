//
//  CloserUpgradeVC.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/11/24.
//

import Foundation
import UIKit

//호출-> 리턴

class CloserUpgradeVC: UIViewController {
    // closure context ==> 주변 환경 => 캡쳐리스트
    func basic(param: Int) -> (Int) -> Int {
        let value = param + 20
        
        func append(add: Int) -> Int {
            
            return 30 + add
            
        }
        
        return append
        
    }
    
    
    
    func drawingGame(item: Int) -> (Int) -> String {
        
        //(Int) -> String
        func luckyNumber(number: Int) -> String {
            let result = number * 2
            return "\(result)"
        }
        
        return luckyNumber
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let result = basic(param: 10)
        result(10)
        result(10)
        result(10)
        
      //  let result = drawingGame(item: 10)
        //외부 함수의 생명주기가 끝나더라도, 내부 함수는 계속 사용할 수 있다.
        //
        print(result(10))
        print(result(10))
        print(result(10))
        
        
    }
    //외부 함수내에 선언되어 있는 내부 함수는 외부 함수의 생명주기에 영향을 받습니다.
    //내부 함수의 생명주기는 외부로부터 차단되어 있으며, 따라서 은닉성의 특성을 지닙니다.
    //외부 함수의 생명주기와 상관없이 내부 함수를 얼마든지 호출하게 된 것입니다.
    //즉, 외부 함수가
    
    
    
}
