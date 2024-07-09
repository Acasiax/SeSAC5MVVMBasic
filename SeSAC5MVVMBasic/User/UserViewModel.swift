//
//  UserViewModel.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/9/24.
//

import Foundation

class UserViewModel {
    
    //userList
    var outputList = Observable([User(name: "붕어빵", age: 13)])
    
    //화면이 떴다는 신호도 감지하자
    //처음에 로드
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    
    // +
    var inputAddTapped: Observable<Void?> = Observable(nil)
    // 전체 삭제
    var inputRemoveButtonTapped: Observable<Void?> = Observable(nil)
    
    
    init() {
        inputAddTapped.bind {_ in 
            print("====click=====")
            let user = User(name: "jack", age: .random(in: 1...80))
            self.outputList.value.append(user)
            
        }
        
        //init이 무조건 한번 실행되기 때문에 이거 주석처리하면 아무것도 안나옴
        inputRemoveButtonTapped.bind{ _ in
            self.outputList.value.removeAll()
        }
        
        inputViewDidLoadTrigger.bind {_ in 
            
            
            let user = [
                User(name: self.generateRandomName(), age: .random(in: 1...100)),
                User(name: self.generateRandomName(), age: .random(in: 1...100)),
                
                User(name: self.generateRandomName(), age: .random(in: 1...100)),
                
                User(name: self.generateRandomName(), age: .random(in: 1...100)),
                User(name: self.generateRandomName(), age: .random(in: 1...100)),
            ]
            self.outputList.value = user
        }
        
    }
    func generateRandomName() -> String {
           let firstNames = ["John", "Jane", "Mike", "Emily", "David", "Sarah", "Chris", "Anna"]
           let lastNames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Wilson"]
           
           let randomFirstName = firstNames.randomElement() ?? ""
           let randomLastName = lastNames.randomElement() ?? ""
           
           return "\(randomFirstName) \(randomLastName)"
       }
       
  
}

//과제
    //모두 국내 해외 모두 인풋이에요
