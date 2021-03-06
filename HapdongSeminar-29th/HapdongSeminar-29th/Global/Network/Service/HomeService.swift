//
//  HomeService.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/20.
//

import Foundation



protocol HomeSerViceType {
  
  func getEventBannerList(completion : @escaping (Result<HomeBannerDataModel?, Error>) -> Void)
  func getReviewList(completion : @escaping (Result<[HomeReviewDataModel]?, Error>) -> Void)
    func postReviewLike(reviewID: Int, completion : @escaping (Result<[HomeReviewDataModel]?, Error>) -> Void)
    
}

extension BaseService : HomeSerViceType{
  func getEventBannerList(completion: @escaping (Result<HomeBannerDataModel?, Error>) -> Void) {
    requestObject(.getEventBannerList, completion: completion)
  }
  
  func getReviewList(completion: @escaping (Result<[HomeReviewDataModel]?, Error>) -> Void) {
    requestObject(.getReviewList, completion: completion)
  }
  func postReviewLike(reviewID : Int,completion: @escaping (Result<[HomeReviewDataModel]?, Error>) -> Void) {
    requestObject(.postReviewLike(reviewID: reviewID), completion: completion)
  }
}


/**
protocol AccountServiceType {
  
  func postUserSignIn(email : String, password : String, completion: @escaping (Result<AccountDataGettable?, Error>) -> Void)
  func postUserSignUp(email : String, password : String, name : String,completion: @escaping (Result<AccountDataGettable?, Error>) -> Void)
  
}

extension BaseService : AccountServiceType{
  func postUserSignIn(email: String, password: String, completion: @escaping (Result<AccountDataGettable?, Error>) -> Void) {
    requestObject(.postSignIn(email: email, pw: password), completion: completion)
  }
  
  func postUserSignUp(email: String, password: String, name: String, completion: @escaping (Result<AccountDataGettable?, Error>) -> Void) {
    print(email,password,name)
    requestObject(.postSignUp(email: email, pw: password, name: name), completion: completion)
  }
  
}
 */
