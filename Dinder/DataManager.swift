//
//  DataManager.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import Firebase

class DataManager{

    var events: [Event] = FakeEvents().events
    var users: [User] = FakeUsers().users
    var currentEventNum = 0
    var ref: DatabaseReference!
    
    
    
    
    func getNextEvent(filters: [String:String]) -> Event{
        currentEventNum += 1
        
        let u: User = getUserFromFirebase(userId: 55)

        
        
        return self.events[currentEventNum % events.count] // need dictionary of options, plus keep track of current event
        
    }

    
    func getUser(userId: Int) -> User{
        return self.users[0] // check userId field
    }

    
    
    func getUserFromFirebase(userId: Int) -> User{
        
        let usersRef = Database.database().reference(withPath: "Users")
        let firstNameRef = usersRef.child("firstname")
        print(usersRef.key!)
        print(firstNameRef.key!)
       // print(usersRef.value(forKey: "firstname")!)
        
    
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // 1
            if let userDict = snapshot.value as? [String : Any] {
                print(userDict.debugDescription)
            }
        })
        
        
/* from firebase:
 {
 "firstname" : "Jenny",
 "userId" : 55
 }

 */
        
        /*let userId: Int
        let firstName: String
        let birthDate: Date
        let gender: Gender
        var emailAddress: String
        var mobilePhoneNumber: String?
        var images: [Image]
        var ratings: [UserRating]*/
        
        
        return users[0]
    }
    
    
    func getOwnerOf(event: Event) -> User{
        return self.users[0] // check owner field
    }
    
    func getApplicantsFor(event: Event) -> [User]{
        return [User]() // checking interestedUsers[] field
    }
}
