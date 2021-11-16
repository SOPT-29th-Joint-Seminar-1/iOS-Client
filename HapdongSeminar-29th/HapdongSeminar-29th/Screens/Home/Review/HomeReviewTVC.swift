//
//  HomeReviewTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/13.
//

import UIKit

class HomeReviewTVC: UITableViewCell {

    // MARK: - Vars & Lets Part
    static let identifier = "HomeReviewTVC"
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    var reviewContentList: [HomeReviewModel] = []
    
    // MARK: - UI Component Part

    
    // MARK: - Life Cycle Part

      override func awakeFromNib() {
          super.awakeFromNib()
          setPager()
          registerCVC()
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

      }
      
    // MARK: - IBAction Part
    @IBAction func pageChanged(_ sender: UIPageControl) {
        //        eventImgView.image = UIImage(named: imgName[pager.currentPage])

    }
    
    // MARK: - Custom Method Part
    func setPager() {
//        //페이지 컨트롤의 전체 페이지를 배열의 전체 개수 값으로 설정
//        pager.numberOfPages = imgName.count
//        // 페이지 컨트롤의 현재 페이지를 0으로 설정
//        pager.currentPage = 0
//        eventImgView.image = UIImage(named: imgName[0])
    }
    
    func registerCVC() {
        reviewCollectionView.dataSource = self
        reviewCollectionView.delegate = self
        
        let reviewdetailCVC = UINib(nibName: HomeReviewCVC.identifier, bundle: nil)
        reviewCollectionView.register(reviewdetailCVC, forCellWithReuseIdentifier: HomeReviewCVC.identifier)
        
    }
    
    func initReviewDataList(){
        reviewContentList.append(contentsOf: [
            HomeReviewModel(image: "img_review1", userId: "깨끗한사과", numOfUse: "세특 15회차", date: "어제", review: "만족합니다. 세특 알고 삶이 편해졌어요. ^^", like:"0"),
            HomeReviewModel(image: "img_review2", userId: "민수", numOfUse: "세특 2회차", date: "어제", review: "종종 자주 이용할게요!", like:"0"),
            HomeReviewModel(image: "img_review3", userId: "미뇽이", numOfUse: "세특 12회차", date: "어제", review: "좋습니다:)", like:"0")
        ])
    }
    

    // MARK: - @objc Function Part

  }

// MARK: - Extension Part
extension HomeReviewTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeReviewCVC.identifier, for: indexPath) as? HomeReviewCVC else {return UICollectionViewCell()}
        
        cell.setData(project: reviewContentList[indexPath.row])
        return cell
    }
}

extension HomeReviewTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 316, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

