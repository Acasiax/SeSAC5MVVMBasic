//
//  MarketDetailViewModel.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/15/24.
//

import Foundation

class MarketDetailViewModel {
    
    var outputMarketData: Observable<Market?> = Observable(nil)
    
    
    init() {
        print("MarketDetailViewMode", outputMarketData.value)
    }
    
    
}
