//
//  EventInfoCell.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class EventInfoCell: UITableViewCell {
  var eventDescription :UILabel? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  func setUp(cellText: String){
    
    //only create a cell if we need to
    if let eventDescription = eventDescription{
      eventDescription.text = cellText
      return
    }
    eventDescription = UILabel();
    if let eventDescription = eventDescription{
      self.addSubview(eventDescription)
      
      let margins = layoutMarginsGuide
     eventDescription.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
      
      eventDescription.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
      
      eventDescription.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
      
      eventDescription.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
      
      eventDescription.translatesAutoresizingMaskIntoConstraints = false
      
      eventDescription.numberOfLines = 0
      eventDescription.text = cellText
      eventDescription.textColor = UIColor.white
      
    }
    
  }

}
