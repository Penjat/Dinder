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
    
    // Flickr-specific data
    private var searches: [FlickrSearchResults] = []
    private let flickr = Flickr()
    
    
    
    func getEventsUserIsApplyingFor(user: User) -> [Event]?{
        return events;
    }
    
    func getFutureEventsForUser(user: User) -> [Event]?{
        return events;
    }
    
    func createEvent(host: User, eventDetails: Event) -> Event?{
        return events[1];
    }
    
    /* user is interested in this event */
    func applyFor(applicant: User, event: Event){
        print("\(applicant.firstName) interested in \(event.title)")
        
        // update data model
        
        let emailOfHost = event.owner.emailAddress
        
        

        let keyworthyEmail = emailOfHost.replacingOccurrences(of: ".", with: "__DOT__")
        
        let startDateTime = event.startDateTime
        
    
        
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let defaultTimeZoneStr = formatter.string(from: startDateTime)
        
        // firebase key is in format of:
        // email__DOT__COM~yyyy-mm-dd hh:mm:ss
        var key: String = keyworthyEmail
        key.append("~")
        key.append(defaultTimeZoneStr)
        
        print("THE KEY IS \(key)")
        
        
        
        
        let usersRef = Database.database().reference(withPath: "events")
        let amyRef = usersRef.child(key)
        let amyBdRef = amyRef.child("emailaddress")
        amyBdRef.observeSingleEvent(of: .value, with: { (snapshot) in
            print("GOT IT \(snapshot.value ?? "unknown email")!")
        })
        //  amyBdRef.setValue("1999-12-31")
        
       // return users[0]
        
        
        
    }
    
    
    
    func notInterestedIn(user: User, event: Event){
        print("\(user.firstName) not interested in \(event.title)")
    }
    
    
    
    
    func getNextEvent(filters: [String:String]) -> Event{
        
        currentEventNum += 1
        currentEventNum %= self.events.count
        
        let usersRef = Database.database().reference(withPath: "events")
        
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
        
           
            
            if let allEvents = snapshot.value as? [String:Any] {
                for (_,event) in allEvents {
                    print("eeeeeee: \(event)");
                    
                    for(theKey, field) in (event as? [String:Any])!{
                        print("field is \(field) for key \(theKey)")

                    }
                    
                    
                   // let userInterest = profile["Interest"]
                }
            }
            
            
           // let value = snapshot as? [NSDictionary]
            print("VALUE OF KEY IS \(snapshot.key)!")
           // print("found next event: \(title)")
        
        })
        
        return events[currentEventNum];
        
        
    }
    
    
    
    
    
    func getNextEventSpencer(filters: [String:String]) -> Event{
        currentEventNum += 1
        let _: User = getUserFromFirebase(userId: 12)
        return self.events[currentEventNum % events.count] // need dictionary of options, plus keep track of current event
        
        
        
        
        
        
        
        
        
    }
    
    
    func getUser(userId: Int) -> User{
        return self.users[0] // check userId field
    }
    
    
    func getFirstUserFromFirebase(userId: Int) -> User{
        
        let usersRef = Database.database().reference(withPath: "users").child("0")
        
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            print("snapshot value is \(String(describing: snapshot.value))")
            if let userDict = snapshot.value as? [String : Any] {
                // print(userDict.debugDescription)
            }
        })
        return users[0]
        
    }
    
    
    
    func getArrayOfImages(subject: String , receiver: ImageReceiver){
        
        //    var feeds: [Image] = [Image]()
        //  var flickrURL: String = "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=3b801d634be562e16044124f4c11f184&tags="
        
        
        flickr.searchFlickr(for: subject) { searchResults in
            
            switch searchResults {
            case .error(let error) :
                print("Error Searching: \(error)")
            case .results(let results):
                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
                self.searches.insert(results, at: 0)
                
                receiver.receiveImages(images: results)
            }
        }
    }
    
    
    
    
    func getUserFromFirebase(userId: Int) -> User{
        
        let usersRef = Database.database().reference(withPath: "users")
        let amyRef = usersRef.child("amy@tang__DOT__com")
        let amyBdRef = amyRef.child("birthdate")
        amyBdRef.observeSingleEvent(of: .value, with: { (snapshot) in
            print("GOT IT \(snapshot.value ?? "unknown birthdate")!")
        })
      //  amyBdRef.setValue("1999-12-31")
        
        return users[0]
    }
    
    
    
    
    
    func getOwnerOf(event: Event) -> User{
        return self.users[0] // check owner field
    }
    
    func getApplicantsFor(event: Event) -> [User]{
        return [User]() // checking interestedUsers[] field
    }
    
}
