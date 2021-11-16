//
//  GuideProcessTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/17.
//

import UIKit

class GuideProcessTVC: UITableViewCell,UITableViewRegisterable{
  // MARK: - Vars & Lets Part
  private var currentIndex : CGFloat = 0
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
    let screenWidth = UIScreen.main.bounds.width
    let cellWidth = (300/375) * screenWidth
    let cellHeight = cellWidth * (329/300)
    
    let insetX = (10/375) * screenWidth
    let layout = bannerCV.collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
    layout.minimumLineSpacing = 10
    layout.scrollDirection = .horizontal
    bannerCV.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
    bannerCV.decelerationRate = .fast
    bannerCV.delegate = self
    bannerCV.dataSource = self
    bannerCV.backgroundColor = .clear
  }
  
  private func registerCell(){
    GuideProcessPageCVC.register(target: bannerCV)
  }
  
  
}
extension GuideProcessTVC : UICollectionViewDelegate{
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    let layout = bannerCV.collectionViewLayout as! UICollectionViewFlowLayout
    let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
    
    var offSet = targetContentOffset.pointee
    let index = (offSet.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
    let roundedIndex = round(index)
    

    
    offSet = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left,
                     y: -scrollView.contentInset.top)
    targetContentOffset.pointee = offSet
    self.pageControl.currentPage = Int(roundedIndex)
  }
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
