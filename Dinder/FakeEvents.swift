//
//  UserFaker.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import CoreLocation

struct FakeEvents{
    var events: [Event] = [Event]()
    
    init() {
        events.append(getChessKegByJason())

    }
    
    func getChessKegByJason() -> Event{
        
        var fakeUsers: FakeUsers = FakeUsers()
        var anjali: User = fakeUsers.getAnjali()
        var spencer: User = fakeUsers.getSpencer()
        var cassandra: User = fakeUsers.getCassandra()
        var jason: User = fakeUsers.getJason()
        
        var usersInterested: [User] = [User]()
        usersInterested.append(anjali)
        usersInterested.append(spencer)
        usersInterested.append(cassandra)
        
        
        var calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 2
        dateComponents.day = 6
        dateComponents.hour = 18
        dateComponents.minute = 30
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let start = calendar.date(from: dateComponents)
        

         calendar = Calendar.current
         dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 2
        dateComponents.day = 6
        dateComponents.hour = 22
        dateComponents.minute = 0
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let end = calendar.date(from: dateComponents)
        
        
        var locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locManager.location
            
        }
        
        
        let currentDateTime = Date()

        
        var images: [Image] = [Image]()
        let image1: Image = Image()
        
        images.append()
        
//
//        label1.text = "\(currentLocation.coordinate.longitude)"
//        label2.text = "\(currentLocation.coordinate.latitude)"
//
//
        var event: Event = Event(eventId: 0, title: "Brains and Beef", eventRelationshipType: RelationshipType.PossiblyRomantic, lookingFor: Gender.Female, estimatedCombinedTotalCostCAD: 200, estimatedCostForGuestCAD: 0, whoPays: Payer.PosterPays, interestedUsers: usersInterested, owner: jason, chosenPartner: cassandra, images: <#T##[Image]#>, location: currentLocation, startDateTime: start, endDateTime: end, postedDateTime: currentDateTime, description: "")
        
        
        
      
        
        return event
        
        
    }
    
    
    
    
    func getEvent(eventId: Int) -> Event{
        for event in events {
            if event.eventId == eventId{
                return event
            }
        }
        return events[0]
    }
}
