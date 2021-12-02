//
//  HomeEventTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/13.
//

import UIKit
import Moya

class HomeEventTVC: UITableViewCell {

    // MARK: - Vars & Lets Part
    static let identifier = "HomeEventTVC"
    var imgList : [String] = []
    var page : Int = 0
    var imgName: [String] = []
    private var imageList : [HomeBannerDataModel] = []
    
    // MARK: - UI Component Part
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var eventCV: UICollectionView!
    

    
    // MARK: - Life Cycle Part
      override func awakeFromNib() {
          super.awakeFromNib()
//          initEventDataList()
          setPager()
          registerCVC()
          fetchEventItemList()
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)
      }
      
    
    // MARK: - IBAction Part
    @IBAction func pageChanged(_ sender: UIPageControl) {
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        print(indexPath.row)
        print(indexPath.section)

//        eventCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        let screenWidth = CGFloat(indexPath.row) * UIScreen.main.bounds.width
        eventCV.setContentOffset(CGPoint(x: screenWidth , y: 0), animated: true)
        
    }
    
    
    // MARK: - Custom Method Part
    func setPager() {
        //페이지 컨트롤의 전체 페이지를 images 배열의 전체 개수 값으로 설정
        pager.numberOfPages = 3
        // 페이지 컨트롤의 현재 페이지를 0으로 설정
        pager.currentPage = 0
        //페이징 가능하도록
        eventCV.isPagingEnabled = true
    }
    
    func registerCVC() {
        eventCV.dataSource = self
        eventCV.delegate = self
        
        let eventitemCVC = UINib(nibName: HomeEventItemCVC.identifier, bundle: nil)
        eventCV.register(eventitemCVC, forCellWithReuseIdentifier: HomeEventItemCVC.identifier)
    }
    

    
    private func fetchEventItemList(){
        BaseService.default.getEventBannerList { result in
            result.success{ list in
                self.imageList = []
                
                if let banner = list{
                    self.imgList.append(contentsOf: [
                        banner.eventImage1,
                        banner.eventImage2,
                        banner.eventImage3
                    ])
                    print("Banner List",self.imgList)
                    self.eventCV.reloadData()
                }
            }.catch{ error in
//                dump(error)
            }
        }
     }

    // MARK: - @objc Function Part

}


  // MARK: - Extension Part
extension HomeEventTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
    
    //indexPath에 어떤 cell 데이터를 넣을 지 결정하는 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventItemCVC.identifier, for: indexPath) as? HomeEventItemCVC else {return UICollectionViewCell()}

        cell.setData(imgURL: imgList[indexPath.row])
        return cell
    }
}

extension HomeEventTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth
        let cellHeight = cellWidth * (200/375)
        return CGSize(width: cellWidth, height: cellHeight)
//        return CGSize(width: 375, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets.zero
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

extension HomeEventTVC: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    self.pager.currentPage = page
  }
}
