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
    @IBOutlet weak var pickupStarImageView: UIImageView!
    @IBOutlet weak var deliveryStarImageView: UIImageView!
    @IBOutlet weak var laundryStarImageView: UIImageView!
    
    @IBOutlet weak var reviewLabel: UILabel!{
        didSet{
            reviewLabel.setCharacterSpacing()
        }
    }
    @IBOutlet weak var likeLabel: UILabel!
    
    
  // MARK: - UI Component Part


  // MARK: - Life Cycle Part

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        
    }

  // MARK: - IBAction Part


  // MARK: - Custom Method Part
    func setUI(){
        self.layer.cornerRadius = 10
    }
    
    func setData(appData: HomeReviewDataModel){
        switch(appData.id){
        case 1:
            self.reviewImageView.image = UIImage(named: "img_review1")
        case 2:
            self.reviewImageView.image = UIImage(named: "img_review2")
        case 3:
            self.reviewImageView.image = UIImage(named: "img_review3")
        default:
            self.reviewImageView.image = UIImage(named: "img_review1")
        }
        
        self.userIdLabel.text = appData.name
        self.numOfUseLabel.text = "세특 \(appData.usingcount) 회차"
        
        switch (appData.id){
        case 1:
            self.pickupStarImageView.image = UIImage(named: "\(appData.pickupStar)star")
            self.deliveryStarImageView.image = UIImage(named: "\(appData.deliveryStar)star")
            self.laundryStarImageView.image = UIImage(named: "\(appData.laundryStar)star")
        case 2:
            self.pickupStarImageView.image = UIImage(named: "\(appData.pickupStar)star")
            self.deliveryStarImageView.image = UIImage(named: "\(appData.deliveryStar)star")
            self.laundryStarImageView.image = UIImage(named: "\(appData.laundryStar)star")
        case 3:
            self.pickupStarImageView.image = UIImage(named: "\(appData.pickupStar)star")
            self.deliveryStarImageView.image = UIImage(named: "\(appData.deliveryStar)star")
            self.laundryStarImageView.image = UIImage(named: "\(appData.laundryStar)star")
        default:
            self.pickupStarImageView.image = UIImage(named: "5star")
            self.deliveryStarImageView.image = UIImage(named: "5star")
            self.laundryStarImageView.image = UIImage(named: "5star")
        }
        
//        switch (appData.pickupStar) {
//        case 5:
//            self.pickupStarImageView.image = UIImage(named: "5star")
//        case 4:
//            self.pickupStarImageView.image = UIImage(named: "4star")
//        case 3:
//            self.pickupStarImageView.image = UIImage(named: "3star")
//        case 2:
//            self.pickupStarImageView.image = UIImage(named: "2star")
//        case 1:
//            self.pickupStarImageView.image = UIImage(named: "1star")
//        default:
//            self.pickupStarImageView.image = UIImage(named: "5star")
//        }
        
//        switch (appData.deliveryStar) {
//        case 5:
//            self.deliveryStarImageView.image = UIImage(named: "5star")
//        case 4:
//            self.deliveryStarImageView.image = UIImage(named: "4star")
//        case 3:
//            self.deliveryStarImageView.image = UIImage(named: "3star")
//        case 2:
//            self.deliveryStarImageView.image = UIImage(named: "2star")
//        case 1:
//            self.deliveryStarImageView.image = UIImage(named: "1star")
//        default:
//            self.deliveryStarImageView.image = UIImage(named: "5star")
//        }
        
//        switch (appData.laundryStar) {
//        case 5:
//            self.laundryStarImageView.image = UIImage(named: "5star")
//        case 4:
//            self.laundryStarImageView.image = UIImage(named: "4star")
//        case 3:
//            self.laundryStarImageView.image = UIImage(named: "3star")
//        case 2:
//            self.laundryStarImageView.image = UIImage(named: "2star")
//        case 1:
//            self.laundryStarImageView.image = UIImage(named: "1star")
//        default:
//            self.laundryStarImageView.image = UIImage(named: "5star")
//        }
        
        

        self.reviewLabel.text = appData.content
        
        if (appData.likecount > 99){
            self.likeLabel.text = "99+"
        } else {
            self.likeLabel.text = "\(appData.likecount)"
        }
    }



  // MARK: - @objc Function Part


}
  // MARK: - Extension Part






