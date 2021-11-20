//
//  GenericData.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/20.
//

struct GenericResponse<T> {
  let success : Bool
  let status: Int
  let message: String
  let data: T?
  
  enum CodingKeys: String, CodingKey {
    case success
    case status
    case message
    case data
  }
}

extension GenericResponse: Decodable where T: Decodable  {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    success = try container.decode(Bool.self, forKey: .success)
    status = try container.decode(Int.self, forKey: .status)
    message = try container.decode(String.self, forKey: .message)
    data = try? container.decode(T.self, forKey: .data)
  }
}
