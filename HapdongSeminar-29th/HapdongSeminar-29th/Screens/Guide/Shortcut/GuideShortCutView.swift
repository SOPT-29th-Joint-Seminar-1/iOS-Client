//
//  GuideShortCutView.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/17.
//

import UIKit

protocol GuideShortCutDelegate{
  func buttonClicked(index : Int)
}

class GuideShortCutView: UIView {

  // MARK: - Vars & Lets Part

  var delegate : GuideShortCutDelegate?
  var currentIndex = 0{
    didSet{
      setButtonState()
    }
  }
  // MARK: - UI Component Part

  @IBOutlet weak var priceButton: UIButton!
  @IBOutlet weak var manualButton: UIButton!
  @IBOutlet weak var processButton: UIButton!
  
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
    setButtonState()
  }

  // MARK: - IBAction Part

  
  // MARK: - Custom Method Part
  
  private func setButtonActions(){
    priceButton.press { [weak self] in
      self?.currentIndex = 0
      self?.delegate?.buttonClicked(index: 0)
    }
    manualButton.press { [weak self] in
      self?.currentIndex = 1
      self?.delegate?.buttonClicked(index: 1)
    }
    processButton.press { [weak self] in
      self?.currentIndex = 2
      self?.delegate?.buttonClicked(index: 2)
    }
    
  }
  
  private func setButtonState(){
    priceButton.setBackgroundImage(Literals.Image.Guide.shortcutPrice_inactive, for: .normal)
    manualButton.setBackgroundImage(Literals.Image.Guide.shortcutManual_inactive, for: .normal)
    processButton.setBackgroundImage(Literals.Image.Guide.shortcutProcess_inactive, for: .normal)

    if currentIndex == 0{
      priceButton.setBackgroundImage(Literals.Image.Guide.shortcutPrice_active, for: .normal)
    }else if currentIndex == 1{
      manualButton.setBackgroundImage(Literals.Image.Guide.shortcutManual_active, for: .normal)
    }else{
      processButton.setBackgroundImage(Literals.Image.Guide.shortcutProcess_active, for: .normal)
    }
  }
  

  
  // MARK: - @objc Function Part


}

// MARK: - Extension Part




