//
//  BoxOffice.swift
//  SeSAC5MVVMBasic
//
//  Created by jack on 7/16/24.
//

import Foundation
 
struct BoxOfficeResult: Codable {
    let boxOfficeResult: DailyBoxOffice
}

struct DailyBoxOffice: Codable {
    let dailyBoxOfficeList: [Movie]
}

struct Movie: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
}
