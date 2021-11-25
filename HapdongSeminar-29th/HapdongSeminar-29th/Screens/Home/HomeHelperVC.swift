//
//  HomeHelperVC.swift
//  HapdongSeminar-29th
//
//  Created by 안현주 on 2021/11/25.
//

import UIKit

class HomeHelperVC: UIViewController {

    // MARK: - Vars & Lets Part
    
    
        //7. yPosition , cacluateLayout에 가면 값이 정해짐..>!
    var yPosition :CGFloat = 0


    // MARK: - UI Component Part
    
    
    // MARK: - Constraints Part

    @IBOutlet weak var questionMarkTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionMarkLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var guideImageWidthConstraint: NSLayoutConstraint!
    
    // MARK: - Life Cycle Part
  
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateLayouts()
         
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
  // MARK: - IBAction Part

    @IBAction func HomeDismissBtnClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
  // MARK: - Custom Method Part
    
    private func calculateLayouts(){
        //?버튼 Top 제약조건
        questionMarkTopConstraint.constant = 88 - calculateTopInset() - yPosition
        
        //이미지의 가로값
        let screenWidth = UIScreen.main.bounds.width
        guideImageWidthConstraint.constant = screenWidth - 26
    }

  
  // MARK: - @objc Function Part

}
// MARK: - Extension Part
