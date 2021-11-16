//
//  GuideCategoryDataModel.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import Foundation

extension GuideDataModel{
  
  enum CategoryList : String{
    case total = "전체"
    case clothes = "의류"
    case living = "리빙"
    case bedding = "침구"
    case shoes = "신발"
    case leather = "가죽"
    case repair = "수선"
  }
  struct Category{
    var `case` : GuideDataModel.CategoryList
  }
}
