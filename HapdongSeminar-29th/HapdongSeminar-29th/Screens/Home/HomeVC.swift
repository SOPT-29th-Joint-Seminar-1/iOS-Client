//
//  HomeVC.swift
//  HapdongSeminar-29th
//
//  Created by 안현주 on 2021/11/15.
//

import UIKit
import RxSwift

enum HomeCellCase{
  case header
  case event
  case review
  case news

}

class HomeVC: UIViewController {

  // MARK: - Vars & Lets Part

    private let cellCaseList: [HomeCellCase] = [.header,.event,.review,.news]

    
    
    // MARK: - UI Component Part
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var homeTV: UITableView!
    @IBOutlet weak var scrollToTopBtn: UIButton!
    
    @IBOutlet weak var howtouseImageView: UIImageView!
    
  @IBOutlet weak var headerTopConstraint: NSLayoutConstraint!{
    didSet{
      headerTopConstraint.constant = calculateTopInset()
    }
  }
  
    
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        makeDelegate()
        registerXib()
        setTableView()
        setUI()
        notificationUI()
    }
    
  // MARK: - IBAction Part
    @IBAction func touchUpToShowAddress(_ sender: Any) {
        //나중을 위해 언젠가.. 터치를 하면 주소를 정해야하는 팝업..? 이나 주소가..
    }
    
    @IBAction func touchUpToGoTop(_ sender: Any) {
        self.homeTV.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    
  // MARK: - Custom Method Part
    
    private func notificationUI(){
        
        //2. ?Btn과 관련된 Noti를 받는다. -> 근데 setPopUI를 실행한다.
      NotificationCenter.default.addObserver(self,
                                             selector: #selector(setPopUI),
                                             name: NSNotification.Name("?Btn"),
                                             object: nil)
    }
    
    func setUI(){
        scrollToTopBtn.layer.isHidden = true
        scrollToTopBtn.layer.applyShadow(color: .black, alpha: 0.1, x: 2, y: 2, blur: 10, spread: 0)
        scrollToTopBtn.layer.masksToBounds = false
        howtouseImageView.isHidden = true
     }
    
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
    @objc func setPopUI(notification : NSNotification){
        
        // 3. SetPopUI 실행하는데 yPosition 값을 다시 !btn 으로 Noti를 뿌린다. --> Base VC에서 받을 거임
        let yPosition :CGFloat = homeTV.contentOffset.y
        NotificationCenter.default.post(name: NSNotification.Name("!Btn"), object: yPosition)
        
        

  
    }
    
}
// MARK: - Extension Part
extension HomeVC: UITableViewDelegate {
    // 높이 지정 index별
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeVC: UITableViewDataSource {
     //한 section마다 몇개의 row를 넣어야하는지 지정하는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
    
    // indexPath를 활용해 TableViewcell 별로 데이터를 다르게 지정할 수 있다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //section을 row로 바꿈..!
        let cellCase = cellCaseList[indexPath.row]
        
        switch(cellCase){
            
        case .header:
            guard let headerTVC = tableView.dequeueReusableCell(withIdentifier: HomeHeaderTVC.identifier) as?
                    HomeHeaderTVC else {return UITableViewCell()}
            headerTVC.selectionStyle = .none
            return headerTVC
        
        case .event:
            guard let eventTVC = tableView.dequeueReusableCell(withIdentifier: HomeEventTVC.identifier) as?
                    HomeEventTVC else {return UITableViewCell()}
            eventTVC.selectionStyle = .none
            return eventTVC

        case .review:
            guard let reviewTVC = tableView.dequeueReusableCell(withIdentifier: HomeReviewTVC.identifier) as?
                    HomeReviewTVC else {return UITableViewCell()}
            reviewTVC.selectionStyle = .none
            return reviewTVC
            
        case .news:
            guard let newsTVC = tableView.dequeueReusableCell(withIdentifier: HomeNewsTVC.identifier) as?
                    HomeNewsTVC else {return UITableViewCell()}
            newsTVC.selectionStyle = .none
            return newsTVC
        
        }
    }
}


extension HomeVC : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.homeTV.contentOffset.y <= CGFloat(100) {
            scrollToTopBtn.isEnabled = false
            scrollToTopBtn.layer.isHidden = true
        }
        else {
            scrollToTopBtn.isEnabled = true
            scrollToTopBtn.layer.isHidden = false
            scrollToTopBtn.layer.applyShadow(color: .black, alpha: 0.1, x: 2, y: 2, blur: 10, spread: 0)
            scrollToTopBtn.layer.masksToBounds = false
        }
    }
}
