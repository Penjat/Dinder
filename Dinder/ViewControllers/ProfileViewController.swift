//
//  ProfileViewController.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-30.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
 
  
  @IBOutlet weak var profileTableView: UITableView!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      print("loaded profile view controller")
      profileTableView.dataSource = self
      profileTableView.delegate = self
      profileTableView.allowsSelection = false;
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //if it is the main profile picture sectio
    if indexPath.section == 0{
      let cell = profileTableView.dequeueReusableCell(withIdentifier: "mainProfileCell", for: indexPath)
      return cell
    }
    
    //return the profile info cell
    let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileInfoCell", for: indexPath)
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //TODO fix this value
    return view.frame.width
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    //TODO get data from profile
    return 5
    
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if(section == 0){
      return nil
    }
    return nil
  }

}
