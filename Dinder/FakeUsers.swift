//
//  UserFaker.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation


struct FakeUsers{
    var users: [User] = [User]()
    
    init() {
        users.append(getSpencer())
        users.append(getJason())
        users.append(getAnjali())
        users.append(getCassandra())
    }
    
    func getSpencer() -> User{
        
        let calendar = Calendar.current
        
        
        var dateComponents = DateComponents()
        dateComponents.year = 1984
        dateComponents.month = 8
        dateComponents.day = 14
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        
        let bDate = calendar.date(from: dateComponents)
        
        
        
        let rating1: UserRating = UserRating(userRatingCategory: UserRatingCategory.Punctual, positiveReview: false, comment: "very very late", reviewer: getAnjali())
        
        let rating2: UserRating = UserRating(userRatingCategory: UserRatingCategory.Clean, positiveReview: false, comment: "gross", reviewer: getAnjali())
        
        
        var ratings: [UserRating] = [UserRating]()
        ratings.append(rating1)
        ratings.append(rating2)
        
        let spencer = User(userId: 0, firstName: "spencer", birthDate: bDate!, gender: Gender.Male, emailAddress: "pen@jat.com", mobilePhoneNumber: "7787090343", ratings: ratings)
        
        return spencer
        
        
    }
    
    func getJason() -> User{
        
        let calendar = Calendar.current
        
        
        var dateComponents = DateComponents()
        dateComponents.year = 1984
        dateComponents.month = 8
        dateComponents.day = 14
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        
        let bDate = calendar.date(from: dateComponents)
        
        
        
        let rating1: UserRating = UserRating(userRatingCategory: UserRatingCategory.Punctual, positiveReview: true, comment: "punctual, early even", reviewer: getCassandra())
        
        let rating2: UserRating = UserRating(userRatingCategory: UserRatingCategory.Clean, positiveReview: true, comment: "amazing! so clean!!", reviewer: getCassandra())
        
        
        let rating3: UserRating = UserRating(userRatingCategory: UserRatingCategory.AdWasAccurate, positiveReview: true, comment: "we did exactly what he promised", reviewer: getCassandra())
        
        
        let rating4: UserRating = UserRating(userRatingCategory: UserRatingCategory.PositiveExperience, positiveReview: true, comment: "i am in love", reviewer: getCassandra())
        
        
        let rating5: UserRating = UserRating(userRatingCategory: UserRatingCategory.ShowedUp, positiveReview: true, comment: "there he was!", reviewer: getCassandra())
        
        
        
        
        var ratings: [UserRating] = [UserRating]()
        ratings.append(rating1)
        ratings.append(rating2)
        ratings.append(rating3)
        ratings.append(rating4)
        ratings.append(rating5)
        
        
        let jason = User(userId: 1, firstName: "jason", birthDate: bDate!, gender: Gender.Male, emailAddress: "jasonharrisonvancouver@gmail.com", mobilePhoneNumber: "6043742456", ratings: ratings)
        
        return jason
        
        
    }
    
    
    func getAnjali() -> User{
        let calendar = Calendar.current
        
        
        var dateComponents = DateComponents()
        dateComponents.year = 1984
        dateComponents.month = 1
        dateComponents.day = 24
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        
        let bDate = calendar.date(from: dateComponents)
        
        
        let ratings: [UserRating] = [UserRating]()
        
        
        
        let anjali = User(userId: 2, firstName: "anjali", birthDate: bDate!, gender: Gender.Female, emailAddress: "new@fie.com", mobilePhoneNumber: "911", ratings: ratings)
        
        return anjali
    }
    
    
    func getCassandra() -> User{
        let calendar = Calendar.current
        
        
        var dateComponents = DateComponents()
        dateComponents.year = 1979
        dateComponents.month = 7
        dateComponents.day = 13
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        
        let bDate = calendar.date(from: dateComponents)
        
        
        let ratings: [UserRating] = [UserRating]()
        
        
        
        let cassandra = User(userId: 3, firstName: "cassandra", birthDate: bDate!, gender: Gender.Female, emailAddress: "casslyn30@gmail.com", mobilePhoneNumber: "7785490700", ratings: ratings)
        
        return cassandra
    }
    
    
    
    func getUser(userId: Int) -> User{
        for user in users {
            if user.userId == userId{
                return user
            }
        }
        return users[0] 
    }
}
