//
//  HomeEventTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/13.
//

import UIKit

class HomeEventTVC: UITableViewCell {

    // MARK: - Vars & Lets Part
    static let identifier = "HomeEventTVC"
    var imgName:[HomeEventData] = []
    
    // MARK: - UI Component Part
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var eventCV: UICollectionView!
    

    
    // MARK: - Life Cycle Part
      override func awakeFromNib() {
          super.awakeFromNib()
          initEventDataList()
          setPager()
          registerCVC()
          
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)
      }
      
    
    // MARK: - IBAction Part
    @IBAction func pageChanged(_ sender: UIPageControl) {
//        eventImgView.image = UIImage(named: imgName[pager.currentPage])
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        eventCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    // MARK: - Custom Method Part
    func setPager() {
        //페이지 컨트롤의 전체 페이지를 images 배열의 전체 개수 값으로 설정
        pager.numberOfPages = imgName.count
        // 페이지 컨트롤의 현재 페이지를 0으로 설정
        pager.currentPage = 0
//        eventImgView.image = UIImage(named: imgName[0])
    }
    func registerCVC() {
        eventCV.dataSource = self
        eventCV.delegate = self
        
        let eventitemCVC = UINib(nibName: HomeEventItemCVC.identifier, bundle: nil)
        eventCV.register(eventitemCVC, forCellWithReuseIdentifier: HomeEventItemCVC.identifier)
    }
    
    func initEventDataList(){
        imgName.append(contentsOf: [
            HomeEventData(image: "event_1"),HomeEventData(image: "event_2"),HomeEventData(image: "event_3")
        ])
     }
    

    
    // MARK: - @objc Function Part

}

  // MARK: - Extension Part
extension HomeEventTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgName.count
    }
    
    //indexPath에 어떤 cell 데이터를 넣을 지 결정하는 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventItemCVC.identifier, for: indexPath) as? HomeEventItemCVC else {return UICollectionViewCell()}
        
        cell.setData(appData: imgName[indexPath.row])
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
