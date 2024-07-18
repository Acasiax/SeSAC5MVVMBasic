//
//  BoxOfficeViewModel.swift
//  SeSAC5MVVMBasic
//
//  Created by jack on 7/16/24.
//

import Foundation
//ARC. 메모리릭
class BoxOfficeViewModel {
    
    var inputSelectedDate = Observable(Date())
    var inputSearchButtonTapped = Observable(())
    var outputSelectedDate = Observable("")
    var outputList: Observable<[Movie]> = Observable([])
    
    private var query = ""
    
    //텍스트 필드 클릭 > 데이프피커 날짜 > 필스트필드에 yyyy년 MM월 dd일로 반영
    
    init() {
        print("BoxOfficeViewModel init")
        inputSearchButtonTapped.bind { [weak self] _ in
            self?.searchBoxOffice()
            
        }
        
        inputSelectedDate.bind { [weak self] date in
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy년 MM월 dd일 hh:mm"
            let dateToString = dateformatter.string(from: date)
            self?.outputSelectedDate.value = dateToString
            
            
            
            let dateformatter2 = DateFormatter()
            dateformatter2.dateFormat = "yyyyMMdd"
            let dateToString2 = dateformatter2.string(from: self?.inputSelectedDate.value ?? Date())
            self?.query = dateToString2
            
            
            
        }
        
        
        
    }
    
    func searchBoxOffice() {
        
        NetworkService.shared.callRequest(date: query) { response in
            DispatchQueue.main.async {
                switch response {
                case .success(let data):
                    self.outputList.value = data
                case .failure(let failure):
                    print(failure)
                }
            }
           
        }
        
        
        
        
        //        NetworkService.shared.callRequest(date: query) {[weak self] data, error in
        //
        //            DispatchQueue.main.async {
        //
        //                if let error = error {
        //                    print("에러가 발생했어요", error.localizedDescription)
        //                    return
        //                }
        //                if let data = data {
        //                    print("데이터 성공: \(data.count)개")
        //                    dump(data)
        //                    self?.outputList.value = data
        //                }
        //            }
        //        }
        //
        //
        //    }
        
//        deinit {
//            print("BoxOfficeViewModel Deinit")
//        }
        
    }
    
}

