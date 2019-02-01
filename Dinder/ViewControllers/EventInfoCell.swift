//
//  EventInfoCell.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class EventInfoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  func setUp(){
    let eventDescription = UILabel();
    eventDescription.frame = frame
    eventDescription.numberOfLines = 6
    eventDescription.text = "Come and join me for a delightful dinner at Hy's steak house in Whistler."
    eventDescription.textColor = UIColor.white
    self.addSubview(eventDescription)
  }

}
