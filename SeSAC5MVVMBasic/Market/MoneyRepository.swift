//
//  MoneyRepository.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/10/24.
//

import Foundation
import RealmSwift


final class MoneyRepository {
    
    private let realm = try! Realm()
    
//    func fetchItem() -> [Money] {
//        let result = realm.objects(Money.self)
//        return Array(result)
//    }
    
    func createItem(market: String,
                    name: String,
                    won: Int) {
        
        let item = Money(market: market, name: name, won: won)
        
        do {
            try realm.write {
                realm.add(item)
                print("realm Create Succeed")
            }
        } catch {
            print(error)
        }
        
    }
    
}



/*
 
 */
