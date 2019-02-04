//
//  MyInterestedEventCell.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-02-03.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class MyInterestedEventCell: UITableViewCell {
  @IBOutlet weak var interestedEventController: MyInterestedEventView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  func setUp(event:Event){
    
    interestedEventController.setUp(event: event)
  }
}
