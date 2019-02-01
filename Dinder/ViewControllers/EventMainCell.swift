//
//  EventMainCell.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class EventMainCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    func setUp(url:String){
    print("setting up")
    let mainImage = UIImageView()
    mainImage.frame = frame
    mainImage.downloaded(from: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")
    
    self.addSubview(mainImage)
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
