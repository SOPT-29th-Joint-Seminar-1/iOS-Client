//
//  HomeReviewDataModel.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/20.
//

import Foundation

struct HomeReviewDataGettable : Codable{
  let reviewList : [HomeReviewDataModel]
}

struct HomeReviewDataModel : Codable{
  let imgURL : String
  let userName : String
  let userCount : Int
  let pickupScore : Int
  let deliveryScore : Int
  let washScore : Int
  let reviewContent : String
  let likeCount : Int
  let isClicked : Bool
}
