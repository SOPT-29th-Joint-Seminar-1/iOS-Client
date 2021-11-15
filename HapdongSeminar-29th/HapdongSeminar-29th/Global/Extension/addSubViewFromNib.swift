//
//  addSubViewFromNib.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

extension UIView{
  public func addSubviewFromNib(view : UIView){
    let view = Bundle.main.loadNibNamed(view.className, owner: self, options: nil)?.first as! UIView
    view.frame = bounds
    addSubview(view)
  }
}
