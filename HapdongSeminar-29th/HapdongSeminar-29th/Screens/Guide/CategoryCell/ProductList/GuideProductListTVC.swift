//
//  GuideProductListTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

class GuideProductListTVC: UITableViewCell,UITableViewRegisterable {


  // MARK: - Vars & Lets Part
  static var isFromNib:  = true
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  
  // MARK: - Life Cycle Parts
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  // MARK: - Custom Method Parts
  
  func setCellData(productName : String, price : Int){
    productNameLabel.text = productName
    priceLabel.text = makeWonString(price: price)
  }
  
  // 1800 -> 1,800원 으로 만들어주는 메서드
  private func makeWonString(price : Int) -> String{
    let numFormatter = NumberFormatter()
    numFormatter.numberStyle = .decimal
    let wonString = numFormatter.string(for: price)! + "원"
    
    return wonString
  }

  
}
