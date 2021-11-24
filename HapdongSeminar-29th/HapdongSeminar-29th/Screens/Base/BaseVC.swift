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
//    notificationUI()
    
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

  private func notificationUI(){
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(setPopUI),
                                           name: NSNotification.Name("?Btn"),
                                           object: nil)
  }
  
  // MARK: - @objc Function Part
  @objc func setPopUI(notification : NSNotification){
    let view = UIView(frame: self.view.frame)
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    view.isHidden = false
        
      self.view.addSubview(view)
        

  }
  
  @objc private func goToGuideView(){
    guard let guideVC = UIStoryboard(name: "Guide", bundle: nil).instantiateViewController(withIdentifier: GuideVC.className) as? GuideVC else {return}
    print("GuideVC")
    self.navigationController?.pushViewController(guideVC, animated: true)
  }
  
}
// MARK: - Extension Part
