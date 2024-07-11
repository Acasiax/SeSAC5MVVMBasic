//
//  MarketViewModel.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/10/24.
//

import Foundation
import Alamofire

final class MarketViewModel {
    
    let repository = MoneyRepository()
    
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    var inputCellSelected: Observable<Market?> = Observable(nil)
    //var inputCellIndexSelected: Observable<Int> = Observable(0)
    var outputTitleData: Observable<String> = Observable("")
    var outputMarketData: Observable<[Market]> = Observable([])
    
    init() {
        transform()
    }
    
    private func transform() {
        //        inputViewDidLoadTrigger.bind {_ in
        //            print("네트워크 통신 진행 예정")
        //            self.fetchUpbitMarketAPI()
        //        }
        inputViewDidLoadTrigger.bind {_ in
            self.callRequest()
        }
        
        inputCellSelected.bind { market in
            print(market)
            guard let market = market else {return}
            self.saveMarket(market: market.market, name: market.korean_name, won: .random(in: 1...10))
            
        }
        
    }
    
    private func saveMarket(market: String, name: String, won: Int) {
        
        repository.createItem(market: market, name: name, won: won)
        
    }
    
    
    func callRequest() {
        APIManager.shared.fetchUpbitMarketAPI{ market, title in
            self.outputMarketData.value = market
            self.outputTitleData.value = title
        }
        
        
        
        func fetchUpbitMarketAPI() {
            let url = "https://api.upbit.com/v1/market/all"
            
            AF.request(url).responseDecodable(of: [Market].self) { response in
                switch response.result {
                case .success(let success):
                    print(success)
                    self.outputMarketData.value = success
                    self.outputTitleData.value = success.first?.korean_name ?? "마켓 목록"
                case .failure(let failure):
                    print(failure)
                }
            }
        }
        
    }
}
