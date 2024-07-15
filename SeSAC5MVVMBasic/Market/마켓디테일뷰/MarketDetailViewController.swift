//
//  MarketDetailViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/15/24.
//

import UIKit

class MarketDetailViewController: UIViewController {

    var detail: Market?
    
    let viewModel = MarketDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
      //  navigationItem.title = detail?.korean_name
       
        print("3")
        viewModel.outputMarketData.bind {market in
            self.navigationItem.title = market?.korean_name
           // self.navigationItem.title = "ddd"
            print("4")
        }
        
    }
    

   

}
