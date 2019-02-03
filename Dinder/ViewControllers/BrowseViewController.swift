//
//  BrowseViewController.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-30.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
  
  @IBOutlet weak var eventController1: EventControllerView!
  @IBOutlet weak var eventController2: EventControllerView!
  

  @IBOutlet weak var eventView1: UIScrollView!
  @IBOutlet weak var eventView2: UIScrollView!
  
  @IBOutlet weak var leadingContraint1: NSLayoutConstraint!
  @IBOutlet weak var trailingConstraint1: NSLayoutConstraint!
  @IBOutlet weak var leadingConstraint2: NSLayoutConstraint!
  @IBOutlet weak var trailingConstraint2: NSLayoutConstraint!
  
  var mainUser :User?
  
  var eventMoving = false
  var isOnFirstEvent = true // tracks if we are on the first or the second event view
  let frontEventZPos = 7.0
  let backEventZPos = 6.0
  
  var eventNumber = 0;
  var colorArray = [UIColor.cyan,UIColor.blue,UIColor.orange,UIColor.purple,UIColor.red,UIColor.yellow]
  
  var dataManager: DataManager?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //set up data manager
    dataManager = DataManager()
    
    //get the main user
    mainUser = dataManager?.getUser(userId: 0)
    
    
    //start out with events
    eventController1.populateEvent(getNextEvent())
    eventController2.populateEvent(getNextEvent())
    
    
    //make sure the navigation controller is on top
    navigationController?.navigationBar.layer.zPosition = 10;
    print("loaded browse view controller")
    
    }
    
    

  func getNextEvent() -> Event{
    return dataManager!.getNextEvent(filters: [:])
  }
  
    @IBAction func swippedLeft(_ sender: Any) {
        print("swipped left")
      leftSipe()
      
    }
    
    @IBAction func swippedRight(_ sender: Any) {
        print("swipped right")
      rightSwipe()
      
    }
    @IBAction func profileButtonPressed(_ sender: Any) {
        print("pressed my profile button")
        //TODO might need to change sender
        performSegue(withIdentifier: "toMyProfile", sender: nil)
    }
    @IBAction func eventsMasterButtonPressed(_ sender: Any) {
        print("pressed Events Master button")
        performSegue(withIdentifier: "toEventsMaster", sender: nil)
    }
    @IBAction func pressedCreateEvent(_ sender: Any) {
        print("pressed create event")
      
        performSegue(withIdentifier: "toCreateEvent", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //send any info we need here
        print("preparing for segue")
      if segue.identifier == "toMyProfile"{
        if let myProfile = segue.destination as? ProfileViewController{
          myProfile.userToDisplay = mainUser
          myProfile.isMyProfile = true
        }
      }else if segue.identifier == "toEventsMaster"{
        
        if let eventsMaster = segue.destination as? EventsMasterViewController{
          eventsMaster.mainUser = mainUser
            
        }
        
      }
    }
    
    
    
}
