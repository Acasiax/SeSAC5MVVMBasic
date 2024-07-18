//
//  NetworkService.swift
//  SeSAC5MVVMBasic
//
//  Created by jack on 7/16/24.
//

//1. viewModel
//2. urlsession
//3. ( , ) Reault Type
//4. memory leak >> init, deinit => ARC, GCD
// - colsure self? [weak self]
// - delegate

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    
    func callRequest(date: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let key = "7837802f3b92cc15de0d033485739761"
     
        
        let urlString = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(key)&targetDt=\(date)"
        
        
        guard let url = URL(string: urlString) else {
            print("URL 문제 있음")
            return
        }
        
        print(Thread.isMainThread, "__1___")
        URLSession.shared.dataTask(with: url) {data, response, error in
            print(Thread.isMainThread, "___2__")
            //에러가 존재한다면, 문제가 있는 상황. 실제 데이터는 없을 거다.
            if let error = error {
                print("Error가 존재하는 상황")
                completion(.failure(error))
          
                return
            }
            
            //에러가 nil 이라는건 성공했다는 가능성이 있다.
            guard let data = data else {
                print("data가 nil인 상황")
                completion(.failure(NSError(domain: "Nodata", code: 0)))
                
              
                return
            }
            
            do {
                let result = try JSONDecoder().decode(BoxOfficeResult.self, from: data)
                print("제대로 성공한 경우")
                completion(.success(result.boxOfficeResult.dailyBoxOfficeList))
               // completion(result.boxOfficeResult.dailyBoxOfficeList, nil) //중요
            } catch {
                print("디코딩 실패")
                completion(.failure(error))
                // completion(nil, error)
            }
            
        }.resume()
    }

}



//프로젝트 경험 얘기해봐라
// 전략적으로 짜자 , 동시성, arc에 대한 걸 풀어서 설명해라

