//
//  GuideService.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/20.
//

import Foundation


protocol GuideSerViceType {
  
  func getCategoryProductList(categoryNum : Int?, completion : @escaping (Result<[GuideDataModel.Product]?, Error>) -> Void)
}

extension BaseService : GuideSerViceType{
  func getCategoryProductList(categoryNum: Int?, completion: @escaping (Result<[GuideDataModel.Product]?, Error>) -> Void) {
    requestObject(.getCategoryList(category: categoryNum), completion: completion)
  }

}
