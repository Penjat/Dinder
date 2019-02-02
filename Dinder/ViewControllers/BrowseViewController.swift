//
//  BrowseViewController.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-30.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
  
  @IBOutlet weak var event1Title: UILabel!
  @IBOutlet weak var event1Date: UILabel!
  @IBOutlet weak var event1LookingFor: UILabel!
  @IBOutlet weak var event1EstimatedCost: UILabel!
  
  @IBOutlet weak var event1Description: UILabel!
  @IBOutlet weak var event1WhoPays: UILabel!
  
  @IBOutlet weak var event1MainImage: UIImageView!
  @IBOutlet weak var event1PosterImage: UIImageView!
  @IBOutlet weak var event1PosterName: UILabel!
  
  
  //    var currentEvent :EventView? //TODO make a custom class
//    var eventToRemove :EventView?
  

  
  
  
    var eventNumber = 0;
    var colorArray = [UIColor.cyan,UIColor.blue,UIColor.orange,UIColor.purple,UIColor.red,UIColor.yellow]
    
    var dataManager: DataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("jenny view loaded")
        
        dataManager = DataManager()
        
        
        
        navigationController?.navigationBar.layer.zPosition = 10;
        print("loaded browse view controller")
        //createNewEvent()
        let eventModel: Event = dataManager!.getNextEvent(filters: [:])
        event1Title.text = eventModel.title
      event1Description.text = eventModel.description
        event1PosterName.text = eventModel.owner.firstName
      event1EstimatedCost.text = "Estimated Cost: \(eventModel.estimatedCostForGuestCAD)"
      
      event1Date.text = self.createReadable(date: eventModel.startDateTime)
    }
    
    
//    UIView.animate(withDuration: 5) {
//      self.trailingConstraint.constant = -self.view.frame.width
//      self.leadingConstraint.constant = -self.view.frame.width
//      self.view.layoutIfNeeded()
  
//    }

  
  
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
        let alertController = UIAlertController( title: "Edit Device Name",
                                                 message: "Enter a new nickname for your device:",
                                                 preferredStyle: .alert)
        alertController.addTextField(configurationHandler: {
            (textField: UITextField) in
            textField.placeholder = "name"
        })
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler: {
            action in
            print("Cancel pressed")
        })
        let saveAction = UIAlertAction(title:"Save", style: .default, handler: {
            action in
            let value = alertController.textFields!.first!.text
            print("Save pressed. Value: \(String(describing: value))")
            
        })
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //send any info we need here
        print("preparing for segue")
    }
    
    
    
}
