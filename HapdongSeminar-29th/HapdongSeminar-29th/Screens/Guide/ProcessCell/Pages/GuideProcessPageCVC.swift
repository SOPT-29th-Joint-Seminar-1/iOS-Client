//
//  GuideProcessPageCVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/17.
//

import UIKit

class GuideProcessPageCVC: UICollectionViewCell,UICollectionViewRegisterable {

  // MARK: - Vars & Lets Part

  static var isFromNib: Bool = true
  
  // MARK: - UI Components Parts
  @IBOutlet weak var bannerImageView: UIImageView!
  
  // MARK: - Life Cycle Parts

  override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  // MARK: - Custom Method Parts

  func setImages(_ index: Int){
    switch(index){
      case 1: bannerImageView.image = Literals.Image.Guide.processStep_1
      case 2: bannerImageView.image = Literals.Image.Guide.processStep_2
      case 3: bannerImageView.image = Literals.Image.Guide.processStep_3
      case 4: bannerImageView.image = Literals.Image.Guide.processStep_4
      default : break
    }
  }

}
