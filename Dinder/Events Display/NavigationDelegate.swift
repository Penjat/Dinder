//
//  NavigationDelegate.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-02-03.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation


protocol NavigationDelegate {
  
  func navigateTo(user:User)
  
  func navigateTo(event:Event)
}
