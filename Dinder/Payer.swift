//
//  Payer.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation


enum Payer{
    case Free
    case PosterPays
    case Dutch
    case ApplicantPays
    case ApplicantGetPaid
  
  func getString() -> String{
    switch(self){
    case .Free:
      return "it's free!"
    case .PosterPays:
      return "it's on me"
    case .Dutch:
      return "we'll go dutch"
    case .ApplicantGetPaid:
      return "you get paid"
    case .ApplicantPays:
      return "you pay"
    
    }
  }
}
