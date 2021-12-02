//
//  HomeReviewModel.swift
//  HapdongSeminar-29th
//
//  Created by 안현주 on 2021/11/16.
//

import UIKit

struct HomeReviewData {
    
    var image : String
    var userId : String
    var numOfUse : Int
    var pickupStar : String
    var deliveryStar : String
    var laundryStar : String
    var review : String
    var like : Int
    

    func makeItemImage() -> UIImage? {
        return UIImage(named: image)
    }
    

}
