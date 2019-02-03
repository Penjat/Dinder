//
//  EventsMasterViewController.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class EventsMasterViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
  var mainUser: User?
  var eventsToShow = [Event]()
  var showingMyEvents = true //true is my events, false is events I am interested in
  
  @IBOutlet weak var noEventsMsg: UIView!
  @IBOutlet weak var noEventsMsgLabel: UILabel!
  
  @IBOutlet weak var eventTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    eventTableView.dataSource = self
    eventTableView.delegate = self
    
    //TODO check the events
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    //if no events show with message
    noEventsMsg.isHidden = (eventsToShow.count > 0)
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
    return eventsToShow.count
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0{
      return 400
    }
    return 250
    
  }
  @IBAction func switchToMyEvents(_ sender: Any) {
    //TODO put in separet function
    showingMyEvents = true
    noEventsMsgLabel.alpha = 0.0
    noEventsMsgLabel.text = "you have created no events"
    UIView.animate(withDuration: 1.0, animations: {
      self.noEventsMsgLabel.alpha = 1.0
    })
    
  }
  @IBAction func switchToInterestedEvents(_ sender: Any) {
    //TODO put in separet function
    showingMyEvents = false
    noEventsMsgLabel.alpha = 0.0
    noEventsMsgLabel.text = "you are not intereste in any events"
    UIView.animate(withDuration: 1.0, animations: {
      self.noEventsMsgLabel.alpha = 1.0
    })
  }
}
