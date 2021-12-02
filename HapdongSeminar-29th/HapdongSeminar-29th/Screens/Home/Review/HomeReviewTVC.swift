//
//  HomeReviewTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/13.
//

import UIKit
import Moya

class HomeReviewTVC: UITableViewCell {

    // MARK: - Vars & Lets Part
  private var currentIndex : CGFloat = 0
  static let identifier = "HomeReviewTVC"
  var reviewContentList: [HomeReviewData] = []
  private var reviewList: [HomeReviewDataModel] = []

  
  // MARK: - UI Component Part

    @IBOutlet weak var reviewCollectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
  
  
  @IBOutlet weak var reviewCollectionHeightConstraint: NSLayoutConstraint!{
    didSet{
      let screenWidth = UIScreen.main.bounds.width
      let cellWidth = screenWidth * (316/375)
      let cellHeight = cellWidth * (200/316)
      reviewCollectionHeightConstraint.constant = cellHeight
    }
  }
  
    // MARK: - Life Cycle Part

      override func awakeFromNib() {
          super.awakeFromNib()
//          initReviewDataList()
          registerCVC()
          setPager()
          setReviewCV()
          fetchReviewItemList()
          addNotiObserver()
          
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

      }
      
    
    // MARK: - IBAction Part
    @IBAction func pageChanged(_ sender: UIPageControl) {
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
                // 인덱스패스위치로 컬렉션 뷰를 스크롤
        reviewCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    // MARK: - Custom Method Part
  private func setReviewCV(){
    
    let screenWidth = UIScreen.main.bounds.width
    let cellWidth = (316/375) * screenWidth
    let cellHeight = cellWidth * (200/316)
    
    let insetX = (20/375) * screenWidth
    let layout = reviewCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
    
    layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
    layout.minimumLineSpacing = 12
    
    layout.scrollDirection = .horizontal
    reviewCollectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
    reviewCollectionView.decelerationRate = .fast

  }
    
    func setPager() {
       //페이지 컨트롤의 전체 페이지를 배열의 전체 개수 값으로 설정
        pager.numberOfPages = 3
       // 페이지 컨트롤의 현재 페이지를 0으로 설정
        pager.currentPage = 0
    }
    
    func registerCVC() {
        reviewCollectionView.dataSource = self
        reviewCollectionView.delegate = self
        
        let reviewdetailCVC = UINib(nibName: HomeReviewCVC.identifier, bundle: nil)
        reviewCollectionView.register(reviewdetailCVC, forCellWithReuseIdentifier: HomeReviewCVC.identifier)
        
    }
    
//    func initReviewDataList(){
//        reviewContentList.append(contentsOf: [
//            HomeReviewData(image: "img_review1", userId: "깨끗한사과", numOfUse: "세특 15회차", review: "만족합니다. 세특 알고 삶이 편해졌어요. ^^", like:"0"),
//            HomeReviewData(image: "img_review2", userId: "민수", numOfUse: "세특 2회차", review: "종종 자주 이용할게요!", like:"0"),
//            HomeReviewData(image: "img_review3", userId: "미뇽이", numOfUse: "세특 12회차", review: "좋습니다:)", like:"0")
//        ])
//    }
    
    private func addNotiObserver(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reviewBtnClicked),
                                               name: NSNotification.Name("like"),
                                               object: nil)
    }
    
    private func postReviewLike(reviewID : Int){
        BaseService.default.postReviewLike(reviewID: reviewID) { result in
            result.success { _ in
                 print("like success")
                self.fetchReviewItemList()
            }.catch { error in
                dump(error)
            }
            
        }
    }
    
    private func fetchReviewItemList(){
        BaseService.default.getReviewList { result in
            result.success { list in
                self.reviewList = []
                
//                self?.itemData = try list.map(HomeReviewDataModel.self)
                if let reviewList = list{
                    self.reviewList = reviewList
//                    self.setPager()
                }
                print("Review List",self.reviewList)
                self.reviewCollectionView.reloadData()
            }.catch{ error in
                print("review Err")
                if let err = error as? MoyaError{
                  dump(err)
                }
                print("엥? ")
                dump(error)
            }
        }
        

     }
    

    // MARK: - @objc Function Part
    @objc func reviewBtnClicked(notification : NSNotification){
        if let index = notification.object as? Int{
            print(index)
            postReviewLike(reviewID: index)
        }
    }

  }

/// 순서가 셀의 버튼을 누름 -> 뷰컨으로 신호전달(델리게이트,노티,클로저) + 인덱스  -> 뷰컨의 좋아요
///
///



// MARK: - Extension Part
extension HomeReviewTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeReviewCVC.identifier, for: indexPath) as? HomeReviewCVC else {return UICollectionViewCell()}
        
        cell.setData(appData: reviewList[indexPath.row])
        return cell
    }
}

extension HomeReviewTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth * (316/375)
        let cellHeight = cellWidth * (200/316)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//      return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}


extension HomeReviewTVC : UIScrollViewDelegate {
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    let layout = reviewCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
    
    var offSet = targetContentOffset.pointee
    let index = (offSet.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
    let roundedIndex = round(index)
    
    offSet = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left,
                     y: -scrollView.contentInset.top)
    targetContentOffset.pointee = offSet
//    self.pageControl.currentPage = Int(roundedIndex)
  }
  
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width // 너비 저장
        let x = scrollView.contentOffset.x + (width / 2.0) // 현재 스크롤한 x좌표 저장
               
        let newPage = Int(x / width)
        if pager.currentPage != newPage {
            pager.currentPage = newPage
        }
    }
}
