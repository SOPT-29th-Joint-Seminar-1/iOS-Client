//
//  GuideCategoryContainerTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

class GuideCategoryContainerTVC: UITableViewCell {

  // MARK: - Vars & Lets Part
    
  @IBOutlet weak var cateogoryCV: UICollectionView!
  @IBOutlet weak var productListTV: UITableView!
  
  // MARK: - UI Component Part
  
  
  // MARK: - Life Cycle Parts
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  // MARK: - Custom Method Parts

    
}
