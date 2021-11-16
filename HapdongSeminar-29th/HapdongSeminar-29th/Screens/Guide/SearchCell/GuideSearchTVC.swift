//
//  GuideSearchTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

protocol GuideSearchDelegate{
  func searchButtonClicked(keyword : String)
}

class GuideSearchTVC: UITableViewCell {
  
  // MARK: - Vars & Lets Part
  
  var delegate : GuideSearchDelegate?
  
  // MARK: - UI Component Part

  
  @IBOutlet weak var searchContainerView: UIView!
  @IBOutlet weak var searchTextField: UITextField!{
    didSet{
      searchTextField.delegate = self
      searchTextField.returnKeyType = .search
    }
  }
  @IBOutlet weak var searchIcon: UIImageView!
  

  // MARK: - Life Cycle Part
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setContainerLayer()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  // MARK: - Custom Method Part
  
  private func setContainerLayer(){
    searchContainerView.layer.cornerRadius = 18
  }
  
}


extension GuideSearchTVC : UITextFieldDelegate{
  func textFieldDidBeginEditing(_ textField: UITextField) {
    searchIcon.image = Literals.Image.Guide.searchIconSelected
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    searchIcon.image = Literals.Image.Guide.searchIcon
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let keyword = textField.text,
       !keyword.isEmpty{
      delegate?.searchButtonClicked(keyword: keyword)
    }
    return true
  }
}
