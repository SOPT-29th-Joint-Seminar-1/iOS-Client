//
//  GuideProcessTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/17.
//

import UIKit

class GuideProcessTVC: UITableViewCell,UITableViewRegisterable{
  // MARK: - Vars & Lets Part
  static var isFromNib = true
  
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var titleLabel: UILabel!{
    didSet{
      titleLabel.setCharacterSpacing()
    }
  }
  @IBOutlet weak var bannerCV: UICollectionView!
  @IBOutlet weak var pageControl: UIPageControl!
  
  // MARK: - Constraint Part
  
  @IBOutlet weak var bannerCVHeightConstraint: NSLayoutConstraint!{
    didSet{
      let cellWidth = UIScreen.main.bounds.width * (300/375)
      let cellHeight = cellWidth * (329/300)
      bannerCVHeightConstraint.constant = cellHeight
      self.layoutIfNeeded()
    }
  }
  
  // MARK: - Life Cycle Part
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setBannerCV()
    registerCell()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  // MARK: - Custom Method Part
  
  private func setBannerCV(){
    bannerCV.delegate = self
    bannerCV.dataSource = self
    bannerCV.backgroundColor = .clear
    bannerCV.isPagingEnabled = true
  }
  
  private func registerCell(){
    GuideProcessPageCVC.register(target: bannerCV)
  }
  
  
}
extension GuideProcessTVC : UICollectionViewDelegate{

}

extension GuideProcessTVC : UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: GuideProcessPageCVC.className, for: indexPath)
            as? GuideProcessPageCVC else{ return UICollectionViewCell() }
    bannerCell.setImages(indexPath.row + 1)
    return bannerCell
  }
  
}

extension GuideProcessTVC : UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellWidth = UIScreen.main.bounds.width * (300/375)
    let cellHeight = cellWidth * (329/300)
    return CGSize(width: cellWidth, height: cellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
  }
  
}

extension GuideProcessTVC : UIScrollViewDelegate{
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    self.pageControl.currentPage = page
  }
}
