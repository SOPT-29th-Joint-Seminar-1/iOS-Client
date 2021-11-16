//
//  GuideWarningTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/17.
//

import UIKit

protocol GuideWarningDelegate{
  func buttonClicked(isFolded : Bool)
}

class GuideWarningTVC: UITableViewCell,UITableViewRegisterable {
  
  //MARK: - Vars & Lets Part
  static var isFromNib: Bool = true
  var isFolded = true
  var delegate : GuideWarningDelegate?
  
  
  //MARK: - UI Components Parts
  @IBOutlet weak var downIconImageView: UIImageView!
  @IBOutlet weak var upIconImageView: UIImageView!
  @IBOutlet weak var warningTextContainerView: UIView!
  @IBOutlet weak var warningTextView: UITextView!
  
  
  //MARK: - Constraint Parts
  @IBOutlet weak var containerHeightConstraint: NSLayoutConstraint!
  
  
  //MARK: - Life Cycle Parts
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setWarningText()
    firstViewSetting()
    setWarningContainer()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  //MARK: - Custom Method Parts
  
  func setFold(_ isFolded: Bool){
    if isFolded{
      containerHeightConstraint.constant = 32
      upIconImageView.alpha = 0
      downIconImageView.alpha = 1
    }else{
      containerHeightConstraint.constant = 284
      upIconImageView.alpha = 1
      downIconImageView.alpha = 0
    }
    self.layoutIfNeeded()

  }
  
  private func firstViewSetting(){
    containerHeightConstraint.constant = 32
    downIconImageView.image = Literals.Image.Guide.warningArrowDown
    upIconImageView.alpha = 0
  }
  
  private func setWarningText(){
    warningTextView.attributedText =     NSAttributedStringHelper.createBulletedList(fromStringArray: Literals.Text.Guide.warningText, font: UIFont.systemFont(ofSize: 11))
    warningTextView.textContainerInset = .zero
    warningTextView.contentInset = .zero
  }
  
  private func setWarningContainer(){
    warningTextContainerView.layer.cornerRadius = 8
  }
  
  @IBAction func foldButtonClicked(_ sender: Any) {
    delegate?.buttonClicked(isFolded: isFolded)
  }
  
}

class NSAttributedStringHelper {
    static func createBulletedList(fromStringArray strings: [String], font: UIFont? = nil) -> NSAttributedString {

        let fullAttributedString = NSMutableAttributedString()
        let attributesDictionary: [NSAttributedString.Key: Any]
    
        if let font = font {
          attributesDictionary = [NSAttributedString.Key.font: font,      NSAttributedString.Key.foregroundColor : UIColor.darkgrey1]
        } else {
            attributesDictionary = [NSAttributedString.Key: Any]()
        }
        for index in 0..<strings.count {
            let bulletPoint: String = "-   "
            var formattedString: String = "\(bulletPoint) \(strings[index])"
        
            if index < strings.count - 1 {
                formattedString = "\(formattedString)\n\n"
            }
        
            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString, attributes: attributesDictionary)
            let paragraphStyle = NSAttributedStringHelper.createParagraphAttribute()
   attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                  ], range: NSMakeRange(0, attributedString.length))
        fullAttributedString.append(attributedString)
       }
    
        return fullAttributedString
    }

    private static func createParagraphAttribute() -> NSParagraphStyle {
        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15, options: NSDictionary() as! [NSTextTab.OptionKey : Any])]
        paragraphStyle.defaultTabInterval = 15
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.headIndent = 15
      paragraphStyle.lineHeightMultiple = 1.3
        return paragraphStyle
    }
}
