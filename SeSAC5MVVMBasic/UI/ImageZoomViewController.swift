//
//  ImageZoomViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/11/24.
//

import UIKit

class ImageZoomViewController: UIViewController {
    
    //이미지가 가로로 여러개 있다고 생각할때, 스크롤뷰에서는 재사용 매커니즘은 동작하지 않는다.
    
    //컬렉션뷰 셀을 옆으로 넘길때 점표시 인디게이터 만드는 방법 3가지
    //1.컬렉션뷰, 2.scroll. 3.pave?
    //배너 : 10개 이미지, 1개가 100M 메가 인 경우
    //1. 컬렉션뷰로 구성하는 경우: 재사용 매커니즘, 보일 때 로드 -> 100M
    //1. 컬렉션뷰로 인디게이터 만들때 - 로드하는 데 시간이 걸린다.
    
    //2.페이지뷰로 구성하는 경우: 300M
    //3. 스크롤뷰로 구성하는 경우: 1G
    //3. 스크롤뷰-> 이미 넘기는 이미지들을 미리 다 로드하고 넘기기만 할때
    
    
    private lazy var scrollView = {
        let view = UIScrollView()
        view.backgroundColor = .green
        view.maximumZoomScale = 4
        view.minimumZoomScale = 1
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        return view
    } ()
    
    
    private lazy var ImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .yellow
        view.image = UIImage(systemName: "star")
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        return view
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(ImageView)
        
        
        scrollView.snp.makeConstraints{ make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
        ImageView.snp.makeConstraints { make in
            make.size.equalTo(scrollView)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
        tap.numberOfTapsRequired = 2
        ImageView.addGestureRecognizer(tap)
        
        
    }
    
    @objc private func doubleTapGesture() {
        print(#function)
        if scrollView.zoomScale == 1 {
            scrollView.setZoomScale(3, animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
}

extension ImageZoomViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return ImageView
    }
   // 왜 안되지
    
}
