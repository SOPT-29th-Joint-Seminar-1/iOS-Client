//
//  makeSpoqaFont.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//


import Foundation
import UIKit

enum SpoqaFontList{
  case thin
  case light
  case regular
  case medium
  case bold
  
}

extension UIFont{
  
  static func setSpoqaFont(style: SpoqaFontList,fontSize : CGFloat) -> UIFont{
    switch(style){
    case .thin: return UIFont(name: "SpoqaHanSansNeo-Thin", size: fontSize)!
    case .light: return UIFont(name: "SpoqaHanSansNeo-Light", size: fontSize)!
    case .regular : return UIFont(name: "SpoqaHanSansNeo-Regular", size: fontSize)!
    case .medium : return UIFont(name: "SpoqaHanSansNeo-Medium", size: fontSize)!
    case .bold: return UIFont(name: "SpoqaHanSansNeo-Bold", size: fontSize)!
      
    }
  }
}

