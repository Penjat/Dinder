//
//  EventsMasterViewController.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class EventsMasterViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
  
  
  
  @IBOutlet weak var eventTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    eventTableView.dataSource = self
    eventTableView.delegate = self
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0{
      let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
      return cell
    }
    let cell = eventTableView.dequeueReusableCell(withIdentifier: "interestedUserCell", for: indexPath)
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }

}
