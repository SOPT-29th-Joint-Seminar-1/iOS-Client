//
//  GuideHeaderTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

class GuideHeaderTVC: UITableViewCell {

  
  // MARK: - UI Component Part

  @IBOutlet weak var topGuideLabel: UILabel!
  @IBOutlet weak var bottomGuideLabel: UILabel!
  
  // MARK: - Life Cycle Parts
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
  // MARK: - Custom Method Part
  
  func setUserName(name : String){
    if !name.isEmpty{
      topGuideLabel.text = "\(name)님 반가워요!"
    }else{
      topGuideLabel.text = "반가워요!"
    }
  }

    
}
