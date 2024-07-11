//
//  HorizentalScrollerVC.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/11/24.
//

import Foundation
import UIKit

class HorizentalScrollerVC: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.backgroundColor = .yellow
        scrollView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)         
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.height.equalTo(50)
            
        }
        
        stackView.spacing = 10
        
        let label = UILabel()
        label.backgroundColor = .orange
        label.text = "sdfdsfdfsfsfdfdsfsdfsfsdfsdfsdfsdfsfsfsdf"
        stackView.addArrangedSubview(label)
        
        let label2 = UILabel()
        label2.backgroundColor = .brown
        label2.text = "sdfdsfdfsfsfsdf"
        stackView.addArrangedSubview(label2)
        
        let label3 = UILabel()
        label3.backgroundColor = .green
        label3.text = "sdfdsfdfsfsfsdf"
        stackView.addArrangedSubview(label3)
        
    }
    
    
    
}



//가로 스크롤 = 스크롤 영역 크기
// 내부 크기를 모두 알아야 한다.
