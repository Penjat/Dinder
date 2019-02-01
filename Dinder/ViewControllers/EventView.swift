//
//  EventView.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class EventView: UIView ,UITableViewDelegate,UITableViewDataSource{
  let eventTableView = UITableView()
  
  
  

  override init(frame: CGRect) {
    
    super.init(frame:frame)
    
    eventTableView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    self.addSubview(eventTableView)
    eventTableView.register(EventMainCell.self, forCellReuseIdentifier: "eventMainCell")
    eventTableView.delegate = self
    eventTableView.dataSource = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0{
      return 400
    }
    return 250
    
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 12
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventMainCell", for: indexPath)
    return cell
  }
  
}
