//
//  AppDelegate.swift
//  SeSAC5MVVMBasic
//
//  Created by jack on 7/9/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UILabel.appearance().font = .boldSystemFont(ofSize: 20)
        UILabel.appearance().textColor = .blue
        UILabel.appearance().backgroundColor = .white
        
        UIButton.appearance().backgroundColor = .red
        
        UITextField.appearance().font = .boldSystemFont(ofSize: 20)
        UITextField.appearance().textAlignment = .center
        
        
        //스크롤이 되냐 안되냐에 따라 2가지로 나뉘어져 있음
        //스크롤 안할때 네비 색깔
        let navigationBarAppearance = UINavigationBarAppearance()
       // navigationBarAppearance.confi
        navigationBarAppearance.backgroundColor = .red
        //<나이는 33살 입니다.> 레이블이 있다고 하면 텍스트 컬러는 블랙으로 설정하면
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.yellow
            
        ]
      //  navigationBarAppearance.largeTitleTextAttributes
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        //스크롤 할때 네비 색깔
        let navigationBarAppearance2 = UINavigationBarAppearance()
        navigationBarAppearance2.backgroundColor = .blue
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance2
        
        //compactAppearance는 가로 모드 일떄 네비 색깔
        
    
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .white
        
        //selected 선택한거
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .blue
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.blue]
        
        //normal 선택안한거
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .blue
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.blue]
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

