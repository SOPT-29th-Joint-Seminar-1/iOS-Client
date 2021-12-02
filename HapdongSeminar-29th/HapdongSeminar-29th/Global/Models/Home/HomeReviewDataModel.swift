//
//  HomeReviewDataModel.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/20.
//

import Foundation

// MARK: - HomeReviewDataModel
struct HomeReviewDataModel: Codable {
    let id: Int
    let name: String
    let pickupStar, deliveryStar, laundryStar, likecount: Int
    let content, image: String
    let usingcount: Int
}
