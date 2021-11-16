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
  private let categoryList = GuideDataModel.Category.getCategorylist()
  private var productList : [GuideDataModel.Product] = []

  private var currentCategory : GuideDataModel.CategoryList = .total{
    didSet{
      productList = GuideDataModel.Product.loadDummyProductList(category: currentCategory)
      productListTV.reloadData()
    }
  }
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
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    40
  }
}

extension GuideCategoryContainerTVC : UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let productCell = tableView.dequeueReusableCell(withIdentifier: GuideProductListTVC.className, for: indexPath) as? GuideProductListTVC else {return UITableViewCell()}
    
    productCell.selectionStyle = .none
    productCell.setCellData(productName: productList[indexPath.row].name,
                            price: productList[indexPath.row].price)
    return productCell
  }
  
  
}


// MARK: - CollectionView DataSource & Delegates
extension GuideCategoryContainerTVC : UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    makeVibrate()
    currentCategory = categoryList[indexPath.row].case
    categoryCV.reloadData()
  }
  
}

extension GuideCategoryContainerTVC : UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    categoryList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let categoryCV = collectionView.dequeueReusableCell(withReuseIdentifier: GuideCategoryNameCVC.className, for: indexPath)
            as? GuideCategoryNameCVC else {return UICollectionViewCell()}
    categoryCV.setName(name: categoryList[indexPath.row].case.rawValue,
                       isClicked: currentCategory == categoryList[indexPath.row].case ? true : false)
    categoryCV.layer.cornerRadius = 15
    
    return categoryCV
  }
  
  
}

extension GuideCategoryContainerTVC : UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14)
    label.text = categoryList[indexPath.row].case.rawValue
    label.sizeToFit()
    
    return CGSize(width: label.frame.width + 28, height: 30)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    4
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
  }
}
