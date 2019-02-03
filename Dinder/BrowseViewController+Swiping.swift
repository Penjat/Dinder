//
//  BrowseViewController+Swiping.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-02-02.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

extension BrowseViewController {
  func rightSwipe(){
    //don't do anything until the event has stopped moving
    if eventMoving {
      return
    }
    if isOnFirstEvent {
      isOnFirstEvent = false
      eventMoving = true
      UIView.animate(withDuration: 1, animations: {
        self.trailingConstraint1.constant = self.view.frame.width*2
        self.leadingContraint1.constant = self.view.frame.width
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
        self.trailingConstraint2.constant = self.view.frame.width*2
        self.leadingConstraint2.constant = self.view.frame.width
        self.view.layoutIfNeeded()
        
        
      }, completion: {(true) in
        self.eventMoving = false
        self.trailingConstraint2.constant = 0
        self.leadingConstraint2.constant = 0
        self.view.insertSubview(self.eventView2,
                                belowSubview: self.eventView1)
      })
    }
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
  func leftSipe(){
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
        self.eventView1.scrollToTop()
        self.trailingConstraint1.constant = 0
        self.leadingContraint1.constant = 0
        self.eventController1.populateEvent(self.getNextEvent())
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
        self.eventView2.scrollToTop()
        self.trailingConstraint2.constant = 0
        self.leadingConstraint2.constant = 0
        self.eventController2.populateEvent(self.getNextEvent())
        self.view.insertSubview(self.eventView2,
                                belowSubview: self.eventView1)
      })
    }
  }
  
}


