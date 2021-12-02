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
        base += "/현주채워넣을자리"
      
      case .getReviewList,
          .postReviewLike:
        base += "/현주채워넣을자리"
      
      case .getCategoryList :
        base += "/category"
    
    }
    guard let url = URL(string: base) else {
      fatalError("baseURL could not be configured")
    }
    return url
  }
  
  // MARK: - Path
  var path: String {
    switch self{
      case .sampleAPI:
        return ""

      case .getReviewList:
        return "/현주채워넣을자리"
      
      case .postReviewLike:
        return "/현주채워넣을자리"
        
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
    switch self{
      case .sampleAPI:
        params[""] = ""
      case .postReviewLike(let reviewID) : 
        params["현주가 채워넣을 키값 이름1"] = "일단 문자열로 채워넣는데 실제로는 맞는 변수 채워넣으세영"
        params["현주가 채워넣을 키값 이름2"] = "일단 문자열로 채워넣는데 실제로는 맞는 변수 채워넣으세영"

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
