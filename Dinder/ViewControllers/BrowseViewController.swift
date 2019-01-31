//
//  BrowseViewController.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-30.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
  
  var currentEvent :EventView? //TODO make a custom class
  var eventToRemove :EventView?
  
  var eventNumber = 0;
  var colorArray = [UIColor.cyan,UIColor.blue,UIColor.orange,UIColor.purple,UIColor.red,UIColor.yellow]
  
    override func viewDidLoad() {
      super.viewDidLoad()
      navigationController?.navigationBar.layer.zPosition = 10;
      print("loaded browse view controller")
      createNewEvent()
      
     
    }
  func createNewEvent(){
    //TODO get event data
    
    currentEvent = EventView(frame: self.view.frame)
    if let event = self.currentEvent{
      self.view.addSubview(event)
      currentEvent?.backgroundColor = colorArray[eventNumber%colorArray.count]
      eventNumber += 1
    }
    
  }
  @IBAction func swippedLeft(_ sender: Any) {
    print("swipped left")
    
    //swap the current event out for a new one
    eventToRemove = currentEvent
    createNewEvent()
    
    //make sure the current event stays on top
    eventToRemove?.layer.zPosition = 5
    UIView.animate(withDuration: 1, animations: {
      
      //slide over and remove the view on completion
      self.eventToRemove?.frame = CGRect(x: -self.view.frame.maxX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height)
    }, completion: {(true) in
      self.eventToRemove?.removeFromSuperview()})
  }
  
  @IBAction func swippedRight(_ sender: Any) {
    print("swipped right")
    
    //swap the current event out for a new one
    eventToRemove = currentEvent
    createNewEvent()
    
    //make sure the current event stays on top
    eventToRemove?.layer.zPosition = 5
    UIView.animate(withDuration: 1, animations: {
      
      //slide over and remove the view on completion
      self.eventToRemove?.frame = CGRect(x: self.view.frame.maxX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height)
    }, completion: {(true) in
      self.eventToRemove?.removeFromSuperview()})
    
    
    let eventAddedMessage = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    eventAddedMessage.text = "event added"
    eventAddedMessage.font = eventAddedMessage.font.withSize(30)
    eventAddedMessage.textColor = UIColor.white
    eventAddedMessage.textAlignment = NSTextAlignment.center
    eventAddedMessage.layer.zPosition = 6
    eventAddedMessage.center = view.center
    view.addSubview(eventAddedMessage)
    UILabel.animate(withDuration: 2, animations: {
      eventAddedMessage.frame = CGRect(x: self.view.center.x, y: self.view.center.y - 100, width: 200, height: 200)
      eventAddedMessage.alpha = 0.0
    })
  }
  @IBAction func profileButtonPressed(_ sender: Any) {
    print("pressed my profile button")
    //TODO might need to change sender
    performSegue(withIdentifier: "toMyProfile", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //send any info we need here
    print("preparing for segue")
  }

  

}
