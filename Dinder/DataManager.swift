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
    
    func getEventsUserIsApplyingFor(user: User) -> [Event]?{
        return events;
    }
    
    func getFutureEventsForUser(user: User) -> Event?{
        return events[0];
    }
    
    func createEvent(host: User, eventDetails: Event) -> Event?{
        return events[1];
    }
    
    // returns true if it worked
    func applyFor(applicant: User, event: Event) -> Bool{
        return true;
    }
    
    func notInterestedIn(user: User, event: Event){
        print("\(user.firstName) not interested in \(event.title)");
    }
    
    func getNextEvent(filters: [String:String]) -> Event{
        currentEventNum += 1
        let _: User = getUserFromFirebase(userId: 12)
        return self.events[currentEventNum % events.count] // need dictionary of options, plus keep track of current event
    }
    
    
    func getUser(userId: Int) -> User{
        return self.users[0] // check userId field
    }
    
    
    func getFirstUserFromFirebase(userId: Int) -> User{
        
        let usersRef = Database.database().reference(withPath: "users").child("0")
        // let firstNameRef = usersRef.child("firstname")
        // print(usersRef.key!)
        // print(firstNameRef.key!)
        // print(usersRef.value(forKey: "firstname")!)
        
        
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            print("snapshot value is \(String(describing: snapshot.value))")
            if let userDict = snapshot.value as? [String : Any] {
                print(userDict.debugDescription)
            }
        })
        return users[0]
    
    }
    
    
    func getUserFromFirebase(userId: Int) -> User{
        
        var usersRef = Database.database().reference(withPath: "users")
        usersRef = Database.database().reference()
       // let firstNameRef = usersRef.child("firstname")
       // print(usersRef.key!)
       // print(firstNameRef.key!)
        // print(usersRef.value(forKey: "firstname")!)
        
        
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            print("snapshot value is \(String(describing: snapshot.value))")
            if let userDict = snapshot.value as? [String : Any] {
                print(userDict.debugDescription)
            }
        })

        
//        ref.queryOrdered(byChild: "completed").observe(.value, with: { snapshot in
//            var newItems: [GroceryItem] = []
//            for child in snapshot.children {
//                if let snapshot = child as? DataSnapshot,
//                    let groceryItem = GroceryItem(snapshot: snapshot) {
//                    newItems.append(groceryItem)
//                }
//            }
//
//            self.items = newItems
//            self.tableView.reloadData()
//        })
        
//        ref.queryOrdered(byChild: "users").observe(.value, with: { snapshot in
//            print("querying")
//            var newUsers: [User] = [User]()
//            for child in snapshot.children {
//                print("child...")
//                if let snapshot = child as? DataSnapshot,
//                    let user = User(snapshot: snapshot) {
//                    newUsers.append(user)
//                }
//            }
//
//            self.users = newUsers
//            print("the users are \(self.users)")
//        })
//
//        print(users[1].emailAddress)
//
        return users[0]
   }

        
        func getOwnerOf(event: Event) -> User{
            return self.users[0] // check owner field
        }
        
        func getApplicantsFor(event: Event) -> [User]{
            return [User]() // checking interestedUsers[] field
        }

}
