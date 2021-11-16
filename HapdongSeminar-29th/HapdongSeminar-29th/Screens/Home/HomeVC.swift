//
//  HomeVC.swift
//  HapdongSeminar-29th
//
//  Created by 안현주 on 2021/11/15.
//

import UIKit

class HomeVC: UIViewController {

  // MARK: - Vars & Lets Part
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var homeTV: UITableView!

    // MARK: - UI Component Part

  
  // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        makeDelegate()
        registerXib()
        setTableView()
    }
    
  // MARK: - IBAction Part
    @IBAction func touchUpToShowAddress(_ sender: Any) {
        //나중을 위해 언젠가.. 터치를 하면 주소를 정해야하는 팝업..? 이나 주소가..
    }
    
  
  // MARK: - Custom Method Part
    func makeDelegate() {
        homeTV.dataSource = self
        homeTV.delegate = self
    }
    
    func registerXib() {
        let headerTVC = UINib(nibName: HomeHeaderTVC.identifier, bundle: nil)
        homeTV.register(headerTVC, forCellReuseIdentifier: HomeHeaderTVC.identifier)
        
        let eventsTVC = UINib(nibName: HomeEventTVC.identifier, bundle: nil)
        homeTV.register(eventsTVC, forCellReuseIdentifier: HomeEventTVC.identifier)
        
        let reviewTVC = UINib(nibName: HomeReviewTVC.identifier, bundle: nil)
        homeTV.register(reviewTVC, forCellReuseIdentifier: HomeReviewTVC.identifier)
        
        let newsTVC = UINib(nibName: HomeNewsTVC.identifier, bundle: nil)
        homeTV.register(newsTVC, forCellReuseIdentifier: HomeNewsTVC.identifier)
    }
    
    func setTableView() {
        //테이블 뷰 셀 사이의 회색 선 없애기
        homeTV.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
  
  // MARK: - @objc Function Part

}
// MARK: - Extension Part
extension HomeVC: UITableViewDelegate {
    // 높이 지정 index별
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) { //HeaderView
            return 252
//            return UITableView.automaticDimension
        }
        else if (indexPath.section == 1) { //EventView
            return 304
//            return UITableView.automaticDimension
        }
        else if (indexPath.section == 2) { //ReviewView
            return 305
//            return UITableView.automaticDimension
        }
        else { //NewsView
            return 464
//            return UITableView.automaticDimension
        }
    }
}

extension HomeVC: UITableViewDataSource {
     //한 section마다 몇개의 row를 넣어야하는지 지정하는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // indexPath를 활용해 TableViewcell 별로 데이터를 다르게 지정할 수 있다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 { //HeaderView
            guard let headerTVC = tableView.dequeueReusableCell(withIdentifier: HomeHeaderTVC.identifier) as?
                    HomeHeaderTVC else {return UITableViewCell()}
            
    //        headertvc.setData(rank: indexPath.row, appData: appContentList[indexPath.row])
            headerTVC.selectionStyle = .none
            return headerTVC
        }
        else if indexPath.section == 1 { //EventView
            guard let eventTVC = tableView.dequeueReusableCell(withIdentifier: HomeEventTVC.identifier) as?
                    HomeEventTVC else {return UITableViewCell()}
            eventTVC.selectionStyle = .none
            return eventTVC
        }
        else if indexPath.section == 2 { //ReviewView
            guard let reviewTVC = tableView.dequeueReusableCell(withIdentifier: HomeReviewTVC.identifier) as?
                    HomeReviewTVC else {return UITableViewCell()}
            reviewTVC.selectionStyle = .none
            return reviewTVC
        }
        else { //NewsView
            guard let newsTVC = tableView.dequeueReusableCell(withIdentifier: HomeNewsTVC.identifier) as?
                    HomeNewsTVC else {return UITableViewCell()}
            newsTVC.selectionStyle = .none
            return newsTVC
        }

    }
}
