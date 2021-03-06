//
//  BaseAPI.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/20.
//

import Moya
import Alamofire


enum BaseAPI{
  case sampleAPI(sample : String)
  // 계정관련
  case getEventBannerList
  case getReviewList
  case postReviewLike(reviewID : Int)
  case getCategoryList(category : Int?)
}


extension BaseAPI: TargetType {

  // MARK: - Base URL
  public var baseURL: URL {
    var base = Config.Network.baseURL
    switch self{
      case .sampleAPI:
        base += ""
      case .getEventBannerList:
        base += "/main"
      case .getReviewList,
        .postReviewLike:
        base += "/review"
      case .getCategoryList :
        base += "/category"
    }
    guard let url = URL(string: base) else {
      fatalError("baseURL could not be configured")
    }
    print("URL",url)
    return url
  }
  
  // MARK: - Path
  var path: String {
    switch self{
      case .sampleAPI:
        return "뒤에붙는 주소"
      case .getReviewList:
        return "/list"
      case .postReviewLike:
        return "/like"
      case .getCategoryList(let category):
        if let num = category{
          return "/\(num)"
        }else{
          return ""
        }
      default :
        return ""
    }
  }
  
  
  // MARK: - Method
  var method: Moya.Method {
    switch self{

      case .postReviewLike :
        return .post
      default :
        return .get

    }
  }
  
  // MARK: - Data
  var sampleData: Data {
    return Data()
  }
  
  // MARK: - Parameters
  private var bodyParameters: Parameters? {
    var params: Parameters = [:]
    switch self {
      case .sampleAPI:
        params[""] = ""
      case .postReviewLike(let reviewID) :
        params["userid"] = 4
        params["reviewid"] = reviewID
      default :
        break
    }
    return params
  }
  
  
  // MARK: - MultiParts
  
  private var multiparts: [Moya.MultipartFormData] {
    switch self{
      case .sampleAPI(_):
        var multiparts : [Moya.MultipartFormData] = []
        multiparts.append(.init(provider: .data("".data(using: .utf8) ?? Data()), name: ""))
        return multiparts
      default : return []
//        images.forEach {
//          multiparts.append(.init(provider: .data($0), name: "images", fileName: "image.jpeg", mimeType: "image/jpeg"))
//        }
    }
  }
  
  
  private var parameterEncoding : ParameterEncoding{
    switch self {
      case .sampleAPI:
        return URLEncoding.init(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)
      default :
        return JSONEncoding.default
    }
  }
  
  
  
  var task: Task {
    switch self{
      case .sampleAPI:
        return .uploadMultipart(multiparts)
        
      case .postReviewLike :
        return .requestParameters(parameters: bodyParameters ?? [:], encoding: parameterEncoding)
        
      default :
        return .requestPlain
      
    }
  }
  
  public var headers: [String: String]? {
      return ["Content-Type": "application/json"]
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
}
