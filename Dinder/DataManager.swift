//
//  DataManager.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation


class DataManager{

    var events: [Event] = FakeEvents().events
    var users: [User] = FakeUsers().users
    var currentEventNum = 1
    
    
    
    func getNextEvent(filters: [String:String]) -> Event{
        currentEventNum += 1
        return self.events[currentEventNum % events.count] // need dictionary of options, plus keep track of current event
    }

    
    func getUser(userId: Int) -> User{
        return self.users[0] // check userId field
    }

    func getOwnerOf(event: Event) -> User{
        return self.users[0] // check owner field
    }
    
    func getApplicantsFor(event: Event) -> [User]{
        return [User]() // checking interestedUsers[] field
    }
}
