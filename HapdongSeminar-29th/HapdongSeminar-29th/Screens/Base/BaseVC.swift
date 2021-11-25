//
//  BaseVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/17.
//

import UIKit
import SnapKit

class BaseVC: UIViewController {
  
  // MARK: - Vars & Lets Part
  
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var containerView: UIView!
  
  @IBOutlet var iconList: [UIImageView]!
  
  @IBOutlet weak var tabbarContainerView: UIView!
  // MARK: - Life Cycle Part
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setContainerViewLayer()
    setConatainerVC()
    addObserver()
    
  }
  
  // MARK: - IBAction Part
  
  @IBAction func homeButtonClicked(_ sender: Any){
    makeVibrate()
    setAllInactiveImage()
    iconList[0].image = Literals.Image.Base.homeIconSelected
  }
  
  @IBAction func membershipButtonClicked(_ sender: Any) {
    makeVibrate()
    setAllInactiveImage()
    iconList[1].image = Literals.Image.Base.membershipIconSelected
  }
  
  @IBAction func userButtonClicked(_ sender: Any) {
    makeVibrate()
    setAllInactiveImage()
    iconList[2].image = Literals.Image.Base.useIconSelected
  }
  
  @IBAction func mypageButtonClicked(_ sender: Any) {
    makeVibrate()
    setAllInactiveImage()
    iconList[3].image = Literals.Image.Base.mypageIconSelected
  }
  
  
  // MARK: - Custom Method Part

  
  private func addObserver(){
    NotificationCenter.default.addObserver(self, selector: #selector(goToGuideView), name: NSNotification.Name("goToGuideView"), object: nil)
    
      //4. BaseVC에서 받는데... setPopUI 실행
      NotificationCenter.default.addObserver(self, selector: #selector(setPopUI), name: NSNotification.Name("!Btn"), object: nil)
     
  }
    
  
  private func setConatainerVC(){
    if let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: HomeVC.className) as? HomeVC{
      addChild(homeVC)
      containerView.addSubview(homeVC.view)
      homeVC.view.snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalToSuperview()
      }
      homeVC.didMove(toParent: self)
    }
  }
  
  private func setAllInactiveImage(){
    iconList[0].image = Literals.Image.Base.homeIcon
    iconList[1].image = Literals.Image.Base.membershipIcon
    iconList[2].image = Literals.Image.Base.useIcon
    iconList[3].image = Literals.Image.Base.mypageIcon
  }
  
  private func setContainerViewLayer(){
    tabbarContainerView.layer.cornerRadius = 21
    tabbarContainerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    tabbarContainerView.layer.applyShadow(color: .black,
                                          alpha: 0.08, x: 0, y: 0,
                                          blur: 15, spread: 0)
  }


  
  // MARK: - @objc Function Part
  @objc func setPopUI(notification : NSNotification){
      
      //5.setPopUI 실행하는데..?
      if let yPos = notification.object as? CGFloat{
          
          let storyboard = UIStoryboard(name: "Home", bundle: nil)
          guard let popupVC = storyboard.instantiateViewController(withIdentifier: HomeHelperVC.className) as? HomeHelperVC else {return}
          
          //6. popUpVCd의 yPosition 실행 --> HomeHelperVC로 이동
          popupVC.yPosition = yPos
          popupVC.modalPresentationStyle = .overCurrentContext
          popupVC.modalTransitionStyle = .crossDissolve
          present(popupVC, animated: true, completion: nil)
      }

        

  }
  
  @objc private func goToGuideView(){
    guard let guideVC = UIStoryboard(name: "Guide", bundle: nil).instantiateViewController(withIdentifier: GuideVC.className) as? GuideVC else {return}
    print("GuideVC")
    self.navigationController?.pushViewController(guideVC, animated: true)
  }
  
}
// MARK: - Extension Part
