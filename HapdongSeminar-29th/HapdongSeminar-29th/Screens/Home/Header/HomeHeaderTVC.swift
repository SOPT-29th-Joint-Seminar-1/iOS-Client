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
    
    // MARK: - UI Component Part
    @IBOutlet weak var mainHeaderLabel: UILabel!{
        didSet{
            mainHeaderLabel.setCharacterSpacing()
        }
    }
    @IBOutlet weak var deliveryInfoBtn: UIButton!
    @IBOutlet weak var firstUserLayerView: UIView!
    @IBOutlet weak var originUserLayerView: UIView!
    @IBOutlet weak var firstUserBtn: UIButton!
    @IBOutlet weak var originUserBtn: UIButton!
    
    
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
        
        //1. ?Btn에 관련된 Notification 뿌리기
        NotificationCenter.default.post(name: NSNotification.Name("?Btn"), object: nil)
        
    }
    
    @IBAction func touchUpToGoGiudeView(_ sender: Any) {
      print("Clicked")
      NotificationCenter.default.post(name: NSNotification.Name("goToGuideView"), object: nil)
    }
    
    
    // MARK: - Custom Method Part
    func setUI(){
        firstUserLayerView.layer.cornerRadius = 10
        originUserLayerView.layer.cornerRadius = 10

    }
    
    // MARK: - @objc Function Part

  }

  // MARK: - Extension Part

