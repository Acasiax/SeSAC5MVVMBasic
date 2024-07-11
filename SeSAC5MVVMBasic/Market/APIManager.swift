//
//  APIManager.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/10/24.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    
    private init() { }
    
    func fetchUpbitMarketAPI(completionHandler: @escaping (([Market], String) -> Void)) {
            let url = "https://api.upbit.com/v1/market/all"
            
            AF.request(url).responseDecodable(of: [Market].self) { response in
                switch response.result {
                case .success(let success):
                    let title = success.first?.korean_name ?? "마켓 목록"
                    completionHandler(success, title)
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    
    
}


//클래스는 참조타입으로, didset 호출이 잘 안되는 경우가 있음.
