//
//  GuideManualTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

class GuideManualTVC: UITableViewCell,UITableViewRegisterable {
  
  // MARK: - Vars & Lets Part
  static var isFromNib = true
  
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var titleLabel: UILabel!{
    didSet{
      titleLabel.setCharacterSpacing()
    }
  }
  @IBOutlet weak var descriptionLabel: UILabel!{
    didSet{
      descriptionLabel.textColor = .darkgrey1
    }
  }
  @IBOutlet weak var stepCV: UICollectionView!{
    didSet{
      stepCV.delegate = self
      stepCV.dataSource = self
    }
  }
  
  // MARK: - UI Component Part

  @IBOutlet weak var stepCVHeightConstraint: NSLayoutConstraint!{
    didSet{
      // cv의 좌우 20씩 , cell 간격 7 빼서 나누기 2하면 셀의 width
      let cellWidth = (UIScreen.main.bounds.width - 40 - 7) / 2
      let cellHeight = cellWidth * (240/164)
  
      stepCVHeightConstraint.constant = cellHeight * 2 + 32
    }
  }
  
  
  // MARK: - Life Cycle Parts
  
    override func awakeFromNib() {
        super.awakeFromNib()
      registerCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
  // MARK: - Custom Method Parts
  
  private func registerCells(){
    GuideManualStepCVC.register(target: stepCV)
  }

}

extension GuideManualTVC : UICollectionViewDelegate{

}

extension GuideManualTVC : UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let stepCell = collectionView.dequeueReusableCell(withReuseIdentifier: GuideManualStepCVC.className, for: indexPath) as? GuideManualStepCVC else {return UICollectionViewCell()}
    stepCell.setStep(indexPath.row + 1)
    
    return stepCell
  }
}



extension GuideManualTVC : UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellWidth = (UIScreen.main.bounds.width - 40 - 7) / 2
    let cellHeight = cellWidth * (240/164)
    
    return CGSize(width: cellWidth, height: cellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    7
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    32
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    .zero
  }
  
}
