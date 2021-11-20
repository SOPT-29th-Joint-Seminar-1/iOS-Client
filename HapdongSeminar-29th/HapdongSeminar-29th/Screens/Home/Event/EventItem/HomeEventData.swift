//
//  HomrEventData.swift
//  HapdongSeminar-29th
//
//  Created by 안현주 on 2021/11/19.
//

import UIKit

struct HomeEventData {
    
    var image : String

    func makeItemImage() -> UIImage? {
        return UIImage(named: image)
    }
    
}
