//
//  HomeHeaderTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/13.
//

import UIKit

class HomeHeaderTVC: UITableViewCell {

    // MARK: - Vars & Lets Part
    static let identifier = "HomeHeaderTVC"
    @IBOutlet weak var deliveryInfoBtn: UIButton!
    @IBOutlet weak var firstUserBtn: UIButton!
    @IBOutlet weak var originUserBtn: UIButton!
    
    
    // MARK: - UI Component Part

    
    // MARK: - Life Cycle Part
      override func awakeFromNib() {
          super.awakeFromNib()
          setUI()
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

      }
      
    // MARK: - IBAction Part
    @IBAction func touchUpToShowInfo(_ sender: Any) {
        //회색 배경 깔고
        //이미지 띄우고
        //3초 띄위기
        //다른곳 터치하면 꺼지기
    }
    
    @IBAction func touchUpToGoGiudeView(_ sender: Any) {
        //가이드뷰로 고고씽
    }
    
    
    // MARK: - Custom Method Part
    func setUI(){
        firstUserBtn.contentHorizontalAlignment = .left
        originUserBtn.contentHorizontalAlignment = .left
    }
    
    // MARK: - @objc Function Part

  }

  // MARK: - Extension Part

