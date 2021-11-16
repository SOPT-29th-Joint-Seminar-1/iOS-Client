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
    
    // MARK: - UI Component Part

    
    // MARK: - Life Cycle Part

      override func awakeFromNib() {
          super.awakeFromNib()
          setPager()
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
    

    // MARK: - @objc Function Part

  }

  // MARK: - Extension Part

