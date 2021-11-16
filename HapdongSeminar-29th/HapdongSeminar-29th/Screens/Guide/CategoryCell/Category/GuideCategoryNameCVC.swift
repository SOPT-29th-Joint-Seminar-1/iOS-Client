//
//  GuideCategoryNameCVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

class GuideCategoryNameCVC: UICollectionViewCell,UICollectionViewRegisterable {
  
  // MARK: - Vars & Lets Part
  
  static var isFromNib = true

  // MARK: - UI Component Part
  
  @IBOutlet weak var nameLabel: UILabel!{
    didSet{
      nameLabel.setCharacterSpacing()
    }
  }
  
  // MARK: - Life Cycle Parts

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  // MARK: - Custom Method Parts
  
  func setName(name : String, isClicked : Bool){
    self.contentView.backgroundColor = isClicked ? .blue1 : .white
    self.nameLabel.font = isClicked ? .boldSystemFont(ofSize: 14) : .systemFont(ofSize: 14)
    self.nameLabel.textColor = isClicked ? .white : .blue1
  }
  
  
}
