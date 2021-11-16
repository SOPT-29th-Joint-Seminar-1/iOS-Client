//
//  GuideManualStepCVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

class GuideManualStepCVC: UICollectionViewCell,UICollectionViewRegisterable {
  
  
  //MARK: - Vars & Lets Part
  
  static let isFromNib: Bool = true
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var stepImageView: UIImageView!
  
  // MARK: - Life Cycle Parts
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  // MARK: - Custom Method Parts
  
  func setStep(_ index: Int){
    switch(index){
      case 1: stepImageView.image = Literals.Image.Guide.manualStep_1
      case 2: stepImageView.image = Literals.Image.Guide.manualStep_2
      case 3: stepImageView.image = Literals.Image.Guide.manualStep_3
      case 4: stepImageView.image = Literals.Image.Guide.manualStep_4
      default : break
    }
  }
  
}
