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
    var reviewId: Int = 0
    var isClicked : Bool = false
    
    
  // MARK: - UI Component Part
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
    
    @IBOutlet weak var likeBackground: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!

    
  // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        
    }

  // MARK: - IBAction Part

    @IBAction func likeBtnClicked(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("like"), object: reviewId)

        
//        isClicked = true
        likeBackground.image = UIImage(named: "best_icon_blue")
        likeLabel.textColor = .blue1
                
        //
        //값이 +
    }
    

  // MARK: - Custom Method Part
    func setUI(){
        self.layer.cornerRadius = 10
    }
    
    func setData(appData: HomeReviewDataModel){
        reviewId = appData.id
        //이미지
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
        
        //닉네임과 세탁 횟수
        self.userIdLabel.text = appData.name
        self.numOfUseLabel.text = "세특 \(appData.usingcount) 회차"
        
        //별점
        print(appData.laundryStar)
        print(appData.pickupStar)
        print(appData.deliveryStar)

        self.pickupStarImageView.image = UIImage(named: "\(appData.pickupStar)star")
        self.deliveryStarImageView.image = UIImage(named: "\(appData.deliveryStar)star")
        self.laundryStarImageView.image = UIImage(named: "\(appData.laundryStar)star")
        
        //리뷰 텍스트
        self.reviewLabel.text = appData.content
        
        //좋아요수
        if (appData.likecount > 99){
            self.likeLabel.text = "99+"
        } else {
            self.likeLabel.text = "\(appData.likecount)"
        }
    }



  // MARK: - @objc Function Part


}
  // MARK: - Extension Part






