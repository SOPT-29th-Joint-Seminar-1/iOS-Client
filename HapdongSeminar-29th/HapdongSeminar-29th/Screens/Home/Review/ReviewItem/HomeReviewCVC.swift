//
//  HomeReviewCVC.swift
//  HapdongSeminar-29th
//
//  Created by 안현주 on 2021/11/16.
//

import UIKit

class HomeReviewCVC: UICollectionViewCell {
  
  // MARK: - Vars & Lets Part
    static let identifier = "HomeReviewCVC"
    @IBOutlet weak var reviewImageView: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var numOfUseLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    
  // MARK: - UI Component Part


  // MARK: - Life Cycle Part

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  // MARK: - IBAction Part


  // MARK: - Custom Method Part
    func setData(appData: HomeReviewData ){
        self.reviewImageView.image = appData.makeItemImage()
        self.userIdLabel.text = appData.userId
        self.numOfUseLabel.text = appData.numOfUse
        self.dateLabel.text = appData.date
        self.reviewLabel.text = appData.review
        self.likeLabel.text = appData.like
    }


  // MARK: - @objc Function Part


}
  // MARK: - Extension Part






