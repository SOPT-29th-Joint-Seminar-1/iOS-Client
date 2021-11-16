//
//  GuideVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/13.
//

import UIKit

// GuideVC - mainTV에 들어가는 cell의 종류를 나열합니다.
enum GuideCellCase{
  case header
  case search
  case category
  case manual
  case warning
  case process
}

class GuideVC: UIViewController {
  
  // MARK: - Vars & Lets Part
  
  private let cellCaseList: [GuideCellCase] = [.header,.search,.category,.manual,.warning,.process]
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var topNaviBar: GuideHeaderView!
  @IBOutlet weak var mainTV: UITableView!
  @IBOutlet weak var bottomCTAButton: UIButton!
  
  
  // MARK: - Constraint Part

  @IBOutlet weak var naviTopConstraint: NSLayoutConstraint!{
    didSet{
      naviTopConstraint.constant = calculateTopInset()
    }
  }
  
  // MARK: - Life Cycle Part
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setMainTV()
    registerCells()
  }
  
  // MARK: - IBAction Part
  
  
  // MARK: - Custom Method Part
  
  private func setMainTV(){
    mainTV.delegate = self
    mainTV.dataSource = self
    mainTV.separatorStyle = .none
  }
  
  private func registerCells(){
    GuideHeaderTVC.register(target: mainTV)
    GuideSearchTVC.register(target: mainTV)
    GuideCategoryContainerTVC.register(target: mainTV)
    GuideManualTVC.register(target: mainTV)
  }
  
  
  // MARK: - @objc Function Part
  
}
// MARK: - Extension Part
extension GuideVC : UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

extension GuideVC : UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellCase = cellCaseList[indexPath.row]
    switch(cellCase){
        
      case .header:
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: GuideHeaderTVC.className, for: indexPath)
                as? GuideHeaderTVC else {return UITableViewCell()}
        headerCell.setUserName(name: "솝트")
        headerCell.selectionStyle = .none
        return headerCell
                
      case .search:
        guard let searchCell = tableView.dequeueReusableCell(withIdentifier: GuideSearchTVC.className, for: indexPath)
                as? GuideSearchTVC else {return UITableViewCell()}
        searchCell.delegate = self
        searchCell.selectionStyle = .none
        
        return searchCell
        
      case .category:
        guard let categoryCell = tableView.dequeueReusableCell(withIdentifier: GuideCategoryContainerTVC.className, for: indexPath)
                as? GuideCategoryContainerTVC else {return UITableViewCell()}
        categoryCell.selectionStyle = .none
        return categoryCell
        
      case .manual:
        guard let manualCell = tableView.dequeueReusableCell(withIdentifier: GuideManualTVC.className, for: indexPath)
                as? GuideManualTVC else {return UITableViewCell()}
        manualCell.selectionStyle = .none
        return manualCell

      case .warning:
        return UITableViewCell()

      case .process:
        return UITableViewCell()
    }
  }
  
  
}

extension GuideVC : GuideHeaderDelegate{
  func backButtonClicked() {
    self.navigationController?.popViewController(animated: true)
  }
  
  func addressClicked() {
    print("Clicked Address")
  }
  
  
}

extension GuideVC : GuideSearchDelegate{
  func searchButtonClicked(keyword: String) {
    self.view.endEditing(true)
  }
  
  
}
