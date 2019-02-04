//
//  InterestedUserCell.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-02-03.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class InterestedUserCell: UICollectionViewCell {
  var myImage: UIImageView?
  func setUp(user:User){
    
    if let image = myImage {
      user.images[0].getImage(imageView: image)
    }else{
      self.myImage = UIImageView(frame: CGRect.zero)
      if let myImage = myImage{
      
        self.addSubview(myImage)
        let margins = self.layoutMarginsGuide
        
        // Pin the leading edge of myView to the margin's leading edge
        myImage.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        
        // Pin the trailing edge of myView to the margin's trailing edge
        myImage.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        myImage.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        myImage.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.backgroundColor = UIColor.yellow
        user.images[0].getImage(imageView: myImage)
      }
    }
    
  }
}
