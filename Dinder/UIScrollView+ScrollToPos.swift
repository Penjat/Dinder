//
//  UIScrollView+ScrollToPos.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-02-03.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

extension UIScrollView {
  func scrollToTop() {
    let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
    setContentOffset(desiredOffset, animated: false)
  }
}
