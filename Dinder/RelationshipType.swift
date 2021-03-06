//
//  RelationshipType.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation

enum RelationshipType: String{
    case Anything
    case Friendship
    case PossiblyRomantic
    case Romantic
  
  func getString() -> String{
    switch(self){
    case .Anything:
      return "Anything"
    case .Friendship:
      return "Friendship"
    case .PossiblyRomantic:
      return "Poissible Romance"
    case .Romantic:
      return "Romance"
    }
  }
}
