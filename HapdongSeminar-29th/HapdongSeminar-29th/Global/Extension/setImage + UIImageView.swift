//
//  setImage + UIImageView.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/19.
//

import UIKit
import Kingfisher

extension UIImageView {
  func setImage(with urlString: String, placeholder: String? = nil, completion: ((UIImage?) -> Void)? = nil) {
    let cache = ImageCache.default
    // 여기는 나중에 url 빈걸로 올때, 처리하는 부분! 이미지는 자유롭게 넣으세여
    if urlString == "" {
      self.image = UIImage()
    } else {
      cache.retrieveImage(forKey: urlString) { result in
        result.success { imageCache in
          if let image = imageCache.image {
            self.image = image
            completion?(image)
          } else {
            self.setNewImage(with: urlString, placeholder: placeholder, completion: completion)
          }
        }.catch { _ in
          self.setNewImage(with: urlString, placeholder: placeholder, completion: completion)
        }
      }
    }
  }
  
  private func setNewImage(with urlString: String, placeholder: String? = nil, completion: ((UIImage?) -> Void)? = nil) {
    guard let url = URL(string: urlString) else { return }
    let resource = ImageResource(downloadURL: url, cacheKey: urlString)
    let placeholder = placeholder == nil ? UIImage() : UIImage(named: placeholder ?? "")
    self.kf.setImage(
      with: resource,
      placeholder: placeholder,
      options: [
        .transition(.fade(0.25)),
        .cacheMemoryOnly
      ],
      completionHandler:  { result in
        result.success { imageResult in
          completion?(imageResult.image)
        }
      }
    )
  }
  
}
