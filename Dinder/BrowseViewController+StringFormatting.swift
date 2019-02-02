//
//  BrowseViewController+StringFormatting.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-02-01.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation

extension BrowseViewController {
  
  func createReadable(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateStyle = DateFormatter.Style.full
//    formatter.timeStyle = .MediumStyle
    
    let dateString = formatter.string(from: date)
    return dateString
  }
  func createString(userIs: Gender , lookingFor: Gender){
    var output = ""
    
    
  }
}
