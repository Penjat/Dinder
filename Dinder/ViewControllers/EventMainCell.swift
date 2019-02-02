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
  func setUp(event: Event?){
    print("setting up")
    
    //add the main image to the cell
    let mainImage = UIImageView()
    mainImage.frame = frame
    mainImage.image = UIImage(named: "hys")
    self.addSubview(mainImage)
    
    //add the eventTitleLabel
    let eventTitleLabel = UILabel()
    eventTitleLabel.frame = CGRect(x: 0, y: frame.maxY-50, width: frame.width, height: 40)
    if let event = event {
      eventTitleLabel.text = event.description
      eventTitleLabel.textColor = UIColor.white
    }
    
    self.addSubview(eventTitleLabel)
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
