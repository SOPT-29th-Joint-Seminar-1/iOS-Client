//
//  GuideProductDataModel.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import Foundation

extension GuideDataModel{
  
  
  struct Product : Codable{
    var name : String
    var price : Int
    var category : GuideDataModel.CategoryList
    
    enum CodingKeys : String,CodingKey{
      case name = "itemName"
      case price = "itemPrice"
      case category = "categoryName"
    }
    
    // 서버 이전에 더미로 리스트 불러오는 함수 제작
    static func loadDummyProductList(category : GuideDataModel.CategoryList) -> [GuideDataModel.Product] {
      switch(category){
        case .clothes :
          return [
            Product(name: "와이셔츠", price: 1800,category: .clothes),
            Product(name: "교복셔츠", price: 1800,category: .clothes),
            Product(name: "일반셔츠, 블라우스", price: 3000,category: .clothes),
            Product(name: "티셔츠", price: 3000,category: .clothes),
            Product(name: "맨투맨, 후드티", price: 4000,category: .clothes),
            Product(name: "니트 스웨터, 가디건", price: 3500,category: .clothes),
            Product(name: "바지, 스커트", price: 6000,category: .clothes),
          ]
          
        case .living :
          return [
            Product(name: "대형러그", price: 30000,category: .living),
            Product(name: "커튼", price: 15000,category: .living),
            Product(name: "대형커튼", price: 30000,category: .living),
            Product(name: "발매트", price: 3000,category: .living),
            Product(name: "쇼파커버", price: 8000,category: .living),
            Product(name: "애견쿠션", price: 25000,category: .living),
            Product(name: "애견의류", price: 7000,category: .living),
          ]
          
        case .bedding :
          return [
            Product(name: "일반토퍼", price: 15000,category: .clothes),
            Product(name: "구스토퍼", price: 25000,category: .clothes),
            Product(name: "양모이불", price: 20000,category: .clothes),
            Product(name: "실크이불", price: 25000,category: .clothes),
            Product(name: "베개커버", price: 2000,category: .clothes),
            Product(name: "베개 (솜)", price: 10000,category: .clothes),
            Product(name: "베개 (다운퍼)", price: 12000,category: .clothes),
          ]
          
        case .shoes :
          return [
            Product(name: "운동화", price: 5000,category: .clothes),
            Product(name: "세무 운동화", price: 7000,category: .clothes),
            Product(name: "구두, 로퍼", price: 7000,category: .clothes),
            Product(name: "스포츠화", price: 7000,category: .clothes),
            Product(name: "워커", price: 11000,category: .clothes),
            Product(name: "부츠", price: 15000,category: .clothes),
            Product(name: "어그부츠", price: 20000,category: .clothes),
          ]
          
        case .leather :
          return [
            Product(name: "가죽바지, 가죽스커트", price: 20000,category: .clothes),
            Product(name: "가죽조끼", price: 20000,category: .clothes),
            Product(name: "가죽자켓", price: 40000,category: .clothes),
            Product(name: "가죽코트", price: 50000,category: .clothes),
            Product(name: "모피자켓", price: 70000,category: .clothes),
            Product(name: "모피코트", price: 100000,category: .clothes),
            Product(name: "모피목도리", price: 30000,category: .clothes),
          ]
          
        case .repair :
          return [
            Product(name: "재박음질", price: 3000,category: .clothes),
            Product(name: "재박음질 (30cm 이상)", price: 7000,category: .clothes),
            Product(name: "재박음질 (안감)", price: 7000,category: .clothes),
            Product(name: "단추달기 / 조이기", price: 1000,category: .clothes),
            Product(name: "후크달기 / 조이기", price: 4000,category: .clothes),
            Product(name: "고무줄 수선", price: 10000,category: .clothes),
            Product(name: "허리수선 (정장바지)", price: 10000,category: .clothes),
          ]

        case .total :
          let totalList = loadDummyProductList(category: .clothes) +
          loadDummyProductList(category: .living) +
          loadDummyProductList(category: .bedding) +
          loadDummyProductList(category: .shoes) +
          loadDummyProductList(category: .leather) +
          loadDummyProductList(category: .repair)
          
          return totalList


      }

    }
  }
  
  
}
