//
//  HomeEventItemCVC.swift
//  HapdongSeminar-29th
//
//  Created by 안현주 on 2021/11/19.
//

import UIKit
import Kingfisher

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
    func setData(imgURL: String){
        eventImageView.setImage(with: imgURL)
//        eventImageView.kf.setImage(with: url)
    }

  // MARK: - @objc Function Part


}
  // MARK: - Extension Part






