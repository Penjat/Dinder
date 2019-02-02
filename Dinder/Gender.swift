//
//  File.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation



enum Gender{
    case Male
    case Female
    case NotApplicable
  
  func getString() -> String{
    //returns a usable string version
    switch (self){
    case .Male:
      return "a Man"
    case .Female:
      return "a Woman"
    case .NotApplicable:
      return "Anyone"
    }
  }
}
