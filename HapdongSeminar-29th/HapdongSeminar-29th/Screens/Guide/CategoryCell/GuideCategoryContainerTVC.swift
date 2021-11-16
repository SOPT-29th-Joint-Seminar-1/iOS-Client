//
//  GuideCategoryContainerTVC.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

class GuideCategoryContainerTVC: UITableViewCell,UITableViewRegisterable {
  
  // MARK: - Vars & Lets Part
  
  static var isFromNib: Bool = true
  // MARK: - UI Component Part
  
  @IBOutlet weak var categoryCV: UICollectionView!
  @IBOutlet weak var productListTV: UITableView!
  
  
  
  // MARK: - Life Cycle Parts
  override func awakeFromNib() {
    super.awakeFromNib()
    setCells()
    setCategoryCV()
    setProductListTV()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  // MARK: - Custom Method Parts
  
  private func setCells(){
    GuideCategoryContainerTVC.register(target: productListTV)
    GuideCategoryNameCVC.register(target: categoryCV)
  }
  
  private func setCategoryCV(){
    categoryCV.delegate = self
    categoryCV.dataSource = self
  }
  
  private func setProductListTV(){
    productListTV.delegate = self
    productListTV.dataSource = self
    productListTV.separatorInset = .zero
    productListTV.separatorColor = .blue5
    productListTV.layer.cornerRadius = 10
    productListTV.backgroundView = UIImageView.init(image: Literals.Image.Guide.productListBackground)
  }
  
}

// MARK: - TableView DataSource & Delegates
extension GuideCategoryContainerTVC : UITableViewDelegate{
  
}

extension GuideCategoryContainerTVC : UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    <#code#>
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    <#code#>
  }
  
  
}


// MARK: - CollectionView DataSource & Delegates
extension GuideCategoryContainerTVC : UICollectionViewDelegate{
  
}

extension GuideCategoryContainerTVC : UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    <#code#>
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    <#code#>
  }
  
  
}

extension GuideCategoryContainerTVC : UICollectionViewDelegateFlowLayout{
  
}
