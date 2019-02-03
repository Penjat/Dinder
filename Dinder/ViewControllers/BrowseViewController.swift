//
//  BrowseViewController.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-30.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
  

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
      
        
        dataManager = DataManager()
      
        mainUser = dataManager?.getUser(userId: 0)
      if let mainUser = mainUser {
        //print("The main user is \(mainUser)")
      }
        
        navigationController?.navigationBar.layer.zPosition = 10;
        print("loaded browse view controller")
//        //createNewEvent()
//        let eventModel: Event = dataManager!.getNextEvent(filters: [:])
//        event1Title.text = eventModel.title
//      event1Description.text = eventModel.description
//        event1PosterName.text = eventModel.owner.firstName
//      event1EstimatedCost.text = "Estimated Cost: \(eventModel.estimatedCostForGuestCAD)"
//
//      event1Date.text = self.createReadable(date: eventModel.startDateTime)
//      event1LookingFor.text = createString(userIs: eventModel.owner.gender, lookingFor: eventModel.lookingFor ?? Gender.NotApplicable)
//      print("downloading image")
//      print("the image url is: \(eventModel.images[1].urlString)")
////      downloadImage(urlString: "https://news.nationalgeographic.com/content/dam/news/2018/05/17/you-can-train-your-cat/02-cat-training-NationalGeographic_1484324.ngsversion.1526587209178.adapt.1900.1.jpg",imageView:self.event1MainImage)
      
      
//      eventModel.images[0].getImage(imageView: event1MainImage)
    }
    
    
//
  func downloadImage(urlString:String , imageView:UIImageView?){
    
  }
  
  
  func createNewEvent(){
        print("creeating new event")
        let eventModel: Event = dataManager!.getNextEvent(filters: [:])
        
        //TODO get event data
//        let guide = view.safeAreaLayoutGuide
//
//        currentEvent = EventView(frame: guide.layoutFrame)
//        if let event = self.currentEvent{
//            self.view.addSubview(event)
//            event.setUp(eventModel: eventModel)
//            currentEvent?.backgroundColor = colorArray[eventNumber%colorArray.count]
//            eventNumber += 1
//          print(#function, "The event hoster is \(eventModel.owner.firstName)")
//          print(#function, "The event name is \(eventModel.description)")
//        }
        
    }
    @IBAction func swippedLeft(_ sender: Any) {
        print("swipped left")
        
//        //swap the current event out for a new one
//        eventToRemove = currentEvent
//        createNewEvent()
//
//        //make sure the current event stays on top
//        eventToRemove?.layer.zPosition = 5
//        UIView.animate(withDuration: 1, animations: {
//
//            //slide over and remove the view on completion
//            self.eventToRemove?.frame = CGRect(x: -self.view.frame.maxX, y: self.view.safeAreaLayoutGuide.layoutFrame.minY, width: self.view.frame.width, height: self.view.frame.height)
//        }, completion: {(true) in
//            self.eventToRemove?.removeFromSuperview()})
      
      //don't do anything until the event has stopped moving
      if eventMoving {
        return
      }
      if isOnFirstEvent {
        isOnFirstEvent = false
        eventMoving = true
      UIView.animate(withDuration: 1, animations: {
        self.trailingConstraint1.constant = -self.view.frame.width
        self.leadingContraint1.constant = -self.view.frame.width
        self.view.layoutIfNeeded()
        
        
        }, completion: {(true) in
          self.eventMoving = false
          self.trailingConstraint1.constant = 0
          self.leadingContraint1.constant = 0
          self.view.insertSubview(self.eventView1,
                                  belowSubview: self.eventView2)
                    })
      }else{
        isOnFirstEvent = true
        eventMoving = true
        UIView.animate(withDuration: 1, animations: {
          self.trailingConstraint2.constant = -self.view.frame.width
          self.leadingConstraint2.constant = -self.view.frame.width
          self.view.layoutIfNeeded()
          
          
        }, completion: {(true) in
          self.eventMoving = false
          self.trailingConstraint2.constant = 0
          self.leadingConstraint2.constant = 0
          self.view.insertSubview(self.eventView2,
                        belowSubview: self.eventView1)
        })
      }
    }
    
    @IBAction func swippedRight(_ sender: Any) {
        print("swipped right")
        
//        //swap the current event out for a new one
//        eventToRemove = currentEvent
//        createNewEvent()
//        
//        //make sure the current event stays on top
//        eventToRemove?.layer.zPosition = 5
//        UIView.animate(withDuration: 1, animations: {
//            
//            //slide over and remove the view on completion
//            self.eventToRemove?.frame = CGRect(x: self.view.frame.maxX, y: self.view.safeAreaLayoutGuide.layoutFrame.minY, width: self.view.frame.width, height: self.view.frame.height)
//        }, completion: {(true) in
//            self.eventToRemove?.removeFromSuperview()})
//        
//        
//        let eventAddedMessage = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        eventAddedMessage.text = "event added"
//        eventAddedMessage.font = eventAddedMessage.font.withSize(30)
//        eventAddedMessage.textColor = UIColor.white
//        eventAddedMessage.textAlignment = NSTextAlignment.center
//        eventAddedMessage.layer.zPosition = 6
//        eventAddedMessage.center = view.center
//        view.addSubview(eventAddedMessage)
//        UILabel.animate(withDuration: 2, animations: {
//            eventAddedMessage.frame = CGRect(x: self.view.center.x, y: self.view.center.y - 100, width: 200, height: 200)
//            eventAddedMessage.alpha = 0.0
//        })
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
