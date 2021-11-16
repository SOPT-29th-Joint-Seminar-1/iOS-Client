//
//  calculateTopInset.swift
//  HapdongSeminar-29th
//
//  Created by 송지훈 on 2021/11/16.
//

import UIKit

// 상단의 탑 safe Area를 계산하는 함수입니다
// 노치가 있는 경우에는 safe area inset 만큼 음수값을 주고,
// 노치가 없는 경우에는 -44로 고정값을 부여합니다

extension UIViewController {
    func calculateTopInset() -> CGFloat {
        let windows = UIApplication.shared.windows[0]
        let topInset = windows.safeAreaInsets.top
        
        if UIDevice.current.hasNotch {
            return topInset * -1
        } else {
            return -44
        }
    }
}

extension UIScreen{
  public var headerTopInset : CGFloat{
    let windows = UIApplication.shared.windows[0]
    let topInset = windows.safeAreaInsets.top
    return UIDevice.current.hasNotch ? topInset * (-1) : -44
  }
}

extension UIDevice {
    var hasNotch: Bool {
      let screenHeight = UIScreen.main.bounds.height
      if screenHeight > 740{
        return true
      }else{
        return false
      }
    }
}
