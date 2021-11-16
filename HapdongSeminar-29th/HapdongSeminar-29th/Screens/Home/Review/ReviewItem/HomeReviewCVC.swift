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
    func setData(project: HomeReviewModel){
        self.reviewImageView.image = project.makeItemImage()
        self.userIdLabel.text = project.userId
        self.numOfUseLabel.text = project.numOfUse
        self.dateLabel.text = project.date
        self.reviewLabel.text = project.review
        self.likeLabel.text = project.like
    }


  // MARK: - @objc Function Part


}
  // MARK: - Extension Part






