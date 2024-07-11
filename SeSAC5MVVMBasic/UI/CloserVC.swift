//
//  CloserVC.swift
//  SeSAC5MVVMBasic
//
//  Created by 이윤지 on 7/11/24.
//

import Foundation
import UIKit

class CloserVC: UIViewController {
    
    let label = UILabel()
    
    //1. 함수를 클로저로 변경해서 상수에 담기
    let a = { (name: String, age: Int) -> Void in
        let des = "\(name)님은 \(age)살 입니다"
        print(des)
    }
    
    
    // (strig, int) -> void
    func hello(name: String, age: Int){
        let des = "\(name)님은 \(age)살 입니다"
        print(des)
    }
    
    
    //2. 클로저를 변경해서 함수로 만들기
    
    func b(date: Date) -> String? {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        return format.string(from: date)
        
    }
    
    
    let today = { date in
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        return format.string(from: date)
        
    }(Date())
    
    //    func todayNumber(random: Int) -> Void {
    //        print(random)
    //    }
    
    func todayNumber(random: (Int) -> Void) {
        random(8)
    }
    
    
    let randomNumber: (Int) -> Void = { (random) in
        print(random)
    }
    
    
    let study2 = {() -> Void in
        print("주말에도 공부하기")
    }
//    
//    func getStudyWithMe(study: () -> ()){
//        print("주말에도 공부하기")
//        study()
//    }
//    
//    
//    //코드를 하나도 생략 안하고 그대로 클로저 구문을 사용한 상태
//    //함수 매개변수 내에 클로저가 그대로 들어간 형태
//    // => 인라인 클로저
//    
//    //함수 뒤에 클로저가 실행
//    //트레일링(후행)클로저
//    getStudyWithMe() { () -> Void in
//    print("주말에도 공부하기")
//})
//

    
    func jack(result: (Int) -> String) {
        result(Int.random(in: 1...100))
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //(Int) -> String
        jack() {
            "행운의 숫자는 \($0)입니다"
            
        }
        
        
        view.addSubview(label)
        
        //filter
        let student = [2.2, 4.5, 3.2, 4.9, 3.3, 2.2]
        
        //4.0이상 취득한 사람만 필터해주세요
        var newStudent: [Double] = []
        
        for item in student {
            if item >= 4.0 {
                newStudent.append(item)
            }
            print(newStudent)
            
            let filterStudent = student.filter { $0 >= 4.0 }
            print(filterStudent)
            
            let number = [Int](1...100)
            print(number)
            
            let mapNumber = number.map { $0 * 5 }
            
            print(mapNumber)
            
            
            let stringNumber = number.map { "\($0)위 입니다"}
            
            print(mapNumber)
            
            let movieList = [
                "괴물" : "박찬욱",
                "기생충" : "봉준호",
                "옥자" : "봉준호",
                "인셉션" : "이순신",
                "인터스텔라" : "문근양",
            ]
            
            //1. 특정(봉준허) 감독의 영화만 틱셔너리 형태로 뽑아오기
            //["","",""]
            let a = movieList.filter { $0.value == "봉준호"}
            
            //2. 봉준호 감독의 영화 제목만 배열 형태로 뽑아오기
            //["기생충","옥자]
            let b = movieList.filter { $0.value == "봉준호"}.map { $0.key}
            
            print(a)
            print(b)
            
            var newNumber: [Int] = []
            for i in number {
                newNumber.append(i * 3)
            }
            print(newNumber)
            
            
            
           
            
 
        }
        
        
        
    }
    
    
    
    
    
    
}
