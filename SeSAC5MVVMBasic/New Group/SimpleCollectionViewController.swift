//
//  SimpleCollectionViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/18/24.
//

import UIKit

/*
 Data: delegate/datasource(인덱스 기반) -> diffable(데이터 기반)
 Layout: height/flow -> compositional -> 14+ listConfiguration
Presentation: cell/view(dq리유즈어블 셀) -> CellRegistration
 
 
 
 register 메서드 대신에 누구를 쓰는가? CellRegistration
 
 */


struct Fruit {
    let name: String
    let count: Int
    let price: Int
}


class SimpleCollectionViewController: UIViewController {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var registerarion: UICollectionView.CellRegistration<UICollectionViewListCell, Fruit>!
    
    let list = [
        Fruit(name: "사과", count: 10, price: 3000),
        Fruit(name: "샤인머스켓", count: 30, price: 14000),
        Fruit(name: "애플망고", count: 2, price: 9000),
        Fruit(name: "바나나", count: 100, price: 1000)
        ]
    
    private func configureDataSource() {
        //collectionView.register > uicollectionview.cellregistration
        registerarion = UICollectionView.CellRegistration {cell, indexPath, itemIdentifier in
            
            //컬렉션뷰의 시스템 셀
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.secondaryText = itemIdentifier.price.formatted() + "원"
            content.textProperties.color = .blue
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .orange
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .yellow
            backgroundConfig.cornerRadius = 40
            backgroundConfig.cornerRadius = 40
            backgroundConfig.strokeColor = .systemRed
            backgroundConfig.strokeWidth = 20
            
            cell.backgroundConfiguration = backgroundConfig
            
          
        }
        
    }
    
    //Flow -> Compositional -> List Configuration
    func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .systemGreen
        configuration.showsSeparators = false
  
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
        
        configureDataSource()
       
    }
    
   
    
    
}


extension SimpleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    
    //  1 custom cell + identifier + register
    // => system cell +     x      + CellRegisteration
    //  2. list[indexPath.item], cell.lame.name => itemIdentifier
    // 3.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 디큐리유즈어플셀 -> .dequeueConfiguredReusableCell
        
        //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "df", for: indexPath) as! UICollectionViewCell
        //        let data = list[indexPath.item]
        
        
        let cell = collectionView.dequeueConfiguredReusableCell(using: registerarion, for: indexPath, item: list[indexPath.item])
        
        return cell
    }
    
    
}
