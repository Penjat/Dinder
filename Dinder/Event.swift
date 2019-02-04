//
//  Event.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import CoreLocation

struct Event{
    
    let eventId: Int
    let title: String
    let eventRelationshipType: RelationshipType?
    let lookingFor: Gender?
    
    let estimatedCombinedTotalCostCAD: Int
    let estimatedCostForGuestCAD: Int
    let whoPays: Payer?
    var interestedUsers: [User]?
    let owner: User
    var chosenPartner: User?
    
    let imageKeywords: [String]
    
    let images: [Image]
    //let imageKeywords: [String]
    
    let location: CLLocation?
    
    let startDateTime: Date
    let endDateTime: Date
    
    let postedDateTime: Date
    
    var description: String

    
    init(eventId: Int, title: String, eventRelationshipType: RelationshipType?, lookingFor: Gender?,
         estimatedCombinedTotalCostCAD: Int, estimatedCostForGuestCAD: Int, whoPays: Payer?,
         interestedUsers: [User], owner: User, chosenPartner: User?, images: [Image],
         location: CLLocation?, startDateTime: Date, endDateTime: Date, postedDateTime: Date, description: String, imageKeywords: [String]) {
        self.eventId = eventId
        self.title = title
        self.eventRelationshipType = eventRelationshipType
        self.lookingFor = lookingFor
        self.estimatedCombinedTotalCostCAD = estimatedCombinedTotalCostCAD
        self.estimatedCostForGuestCAD = estimatedCostForGuestCAD
        self.whoPays = whoPays
        self.interestedUsers = interestedUsers
        self.owner = owner
        
        self.chosenPartner = chosenPartner
        //print("\(String(describing: chosenPartner))")
        
        self.images = images
        self.location = location
        self.startDateTime = startDateTime
        self.endDateTime = endDateTime
        self.postedDateTime = postedDateTime
        self.description = description
        
        self.imageKeywords = imageKeywords
    }
  func getFormattedDate() -> String{
    let gbLocale = Locale(identifier: "en_US")
    let customFormat = "dMMMMhh"
    let ukFormat = DateFormatter.dateFormat(fromTemplate: customFormat, options: 0, locale: gbLocale)
    let formatter = DateFormatter()
    formatter.dateFormat = ukFormat
    return formatter.string(from: startDateTime)
  }
}




