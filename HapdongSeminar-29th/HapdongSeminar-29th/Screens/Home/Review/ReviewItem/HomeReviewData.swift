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
    var numOfUse : String
    var date : String
    var review : String
    var like : String
    

    func makeItemImage() -> UIImage? {
        return UIImage(named: image)
    }
    

}
