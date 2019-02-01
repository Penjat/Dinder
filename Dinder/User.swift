//
//  User.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation



struct User{
    let userId: Int
    let firstName: String
    let birthDate: Date
    let gender: Gender
    var emailAddress: String
    var mobilePhoneNumber: String?
    var images: [Image]
    
    var ratings: [UserRating]
    
    
    init(userId: Int, firstName: String, birthDate: Date, gender: Gender, emailAddress: String, mobilePhoneNumber: String, ratings: [UserRating], images: [Image]) {
        self.userId = userId
        self.firstName = firstName
        self.birthDate = birthDate
        self.gender = gender
        self.emailAddress = emailAddress
        self.mobilePhoneNumber = mobilePhoneNumber
        self.ratings = ratings
        self.images = images
    }
}
