//
//  HomeEventTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/13.
//

import UIKit

class HomeEventTVC: UITableViewCell {

    // MARK: - Vars & Lets Part
    var imgName = ["event_1", "event_2", "event_3"]
    
    static let identifier = "HomeEventTVC"
    @IBOutlet weak var eventCollectionView: UICollectionView!
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
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        eventCollectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
    // MARK: - Custom Method Part
    func setPager() {
        pager.numberOfPages = imgName.count
        pager.currentPage = 0
    }
    
    // MARK: - @objc Function Part

  }

  // MARK: - Extension Part

