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
    let title: String
    let eventRelationshipType: RelationshipType
    let lookingFor: Gender
    
    let estimatedCombinedTotalCostCAD: Int
    let estimatedCostForGuestCAD: Int
    let whoPays: Payer
    var interestedUsers: [User]
    let owner: User
    var chosenParter: User
    let images: [Image]
    
    let location: CLLocation
    
    let startDateTime: Date
    let endDateTime: Date
    
    let postedDateTime: Date
}




