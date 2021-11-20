//
//  HomeEventItemCVC.swift
//  HapdongSeminar-29th
//
//  Created by 안현주 on 2021/11/19.
//

import UIKit

class HomeEventItemCVC: UICollectionViewCell {
  
  // MARK: - Vars & Lets Part
    static let identifier = "HomeEventItemCVC"
    
    
  // MARK: - UI Component Part
    @IBOutlet weak var eventImageView: UIImageView!
    

  // MARK: - Life Cycle Part

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  // MARK: - IBAction Part


  // MARK: - Custom Method Part
    func setData(appData: HomeEventData ){
        eventImageView.image = appData.makeItemImage()
    }

  // MARK: - @objc Function Part


}
  // MARK: - Extension Part






