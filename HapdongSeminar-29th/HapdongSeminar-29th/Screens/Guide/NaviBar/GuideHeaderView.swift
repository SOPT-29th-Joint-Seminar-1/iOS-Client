//
//  GuideHeaderView.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

protocol GuideHeaderDelegate{
  func backButtonClicked()
  func addressClicked()
}

class GuideHeaderView: UIView {

  // MARK: - Vars & Lets Part

  var headerDelegate : GuideHeaderDelegate?

  // MARK: - UI Component Part

  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var addressArrowIcon: UIImageView!
  @IBOutlet weak var addressButton: UIButton!
  
  // MARK: - Life Cycle Part
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviewFromNib(view: self)
    setButtonActions()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addSubviewFromNib(view: self)
    setButtonActions()
  }

  
  // MARK: - Custom Method Part
  
  private func setButtonActions(){
    backButton.press { [weak self] in
      self?.headerDelegate?.backButtonClicked()
    }
    addressButton.press { [weak self] in
      self?.headerDelegate?.addressClicked()
    }
  }

  
  // MARK: - @objc Function Part

}
