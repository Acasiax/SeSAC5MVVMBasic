//
//  VerticalScrollVC.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/11/24.
//

import Foundation
import UIKit

class VerticalScrollVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let imageView = UIImageView()
    let label = UILabel()
    let button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHieratchy()
        configureLayout()
        configureContentView()
    }
    
    func configureHieratchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    
    func configureLayout() {
        scrollView.backgroundColor = .lightGray
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
  
        }
        //위쪽 상단 고정을 버티컬 엣지에 고정해주기
        // contentView 높이 지정 x
        contentView.backgroundColor = .yellow
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView.snp.width)
            make.verticalEdges.equalTo(scrollView)
            
        }
        
        
    }
    
    func configureContentView() {
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.addSubview(button)
        
        
        label.backgroundColor = .orange
        
        label.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(900)
        }
        
        
        imageView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(200)
            
        }
        
        button.backgroundColor = .red
        button.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.top.equalTo(label.snp.bottom).offset(50)
            make.bottom.equalTo(imageView.snp.top).offset(-50)
        }
        
    }
    
    
}
