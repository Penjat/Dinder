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
    var demoEvents = FakeEvents().events
    var users: [User]  = FakeUsers().users
    
    var currentEventNum = 0
    var ref: DatabaseReference!
    
    // Flickr-specific data
    private var searches: [FlickrSearchResults] = []
    private let flickr = Flickr()
    
    
    
    init() {
        createUsers()
        createEvents()
    }
    
    
    
    
    
    func createUsers(){
        let usersRef = Database.database().reference(withPath: "users")
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let allUsers = snapshot.value as? [String:Any] {
                for (_,user) in allUsers {
                    let usr = user as? [String:Any]
                    //print("eeeeeee: \(user) for event key \(userKey)");
                    let emailaddress = usr!["emailaddress"]
                    var birthdate: String = usr!["birthdate"] as! String
                    
                    birthdate = String(birthdate.prefix(10))
                    
                    //print("BIRTHDATE IS \(birthdate)")
                    
                    let gender = usr!["gender"] as! String
                    
                    
                    var g: Gender
                    
                    switch(gender){
                        case "male":
                            g = Gender.Male
                        case "female":
                            g = Gender.Female
                        case "not applicable":
                            g = Gender.NotApplicable
                        default:
                            g = Gender.Female
                    }
                    
                    
                    let mobilePhoneNumber = usr!["mobilephonenumber"]
                    let userId = usr!["userid"]!
                    
                    //print("THE ID IS \(userId)")
                    
                    let userIdAsD: Double = Double(userId as! String)!
                   
                    let theID: Int = Int(round(userIdAsD))
                    
                    let firstName = usr!["firstname"]
                    var imageURLs: [String] = usr!["images"]! as! [String]
                    
                    var images: [Image] = [Image]()
                    
                    for i in 0 ..< imageURLs.count{
                        images.append(Image(keyword: emailaddress as! String, urlString: imageURLs[i]))
                    }
                    
                    
                    let ratings: [UserRating] = [UserRating]()
                    
                    
                    
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
                    let bday = dateFormatter.date(from: birthdate)!
                    
                    
                    
                    let u: User = User(userId: theID,
                                       firstName: firstName as! String,
                                       birthDate: bday,
                                       gender: g,
                                       emailAddress: emailaddress as! String,
                                       mobilePhoneNumber: mobilePhoneNumber as! String,
                                       ratings: ratings,
                                       images: images)
                    
                    self.users.append(u)
                }
            }
        })
    }
    
    
    
    
    
    
    func getEventsUserIsApplyingFor(user: User) -> [Event]?{
        return events;
    }
    
    func getFutureEventsForUser(user: User) -> [Event]?{
        return events;
    }
    
    func createEvent(host: User, eventDetails: Event) -> Event?{
        return events[1];
    }
    
    
    
    
    
    func getEventByHostAndStartTime(hostEmailAddress: String, startTime: Date) -> Event?{
        for i in 0 ..< self.events.count{
            if self.events[i].startDateTime == startTime{
                if self.events[i].owner.emailAddress == hostEmailAddress{
                    return self.events[i]
                }
            }
        }
        
        
        let emailOfHost = hostEmailAddress
        
        
        
        let keyworthyEmail = emailOfHost.replacingOccurrences(of: ".", with: "__DOT__")
        
        let startDateTime = startTime
        
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let defaultTimeZoneStr = formatter.string(from: startDateTime)
        
        // firebase key is in format of:
        // email__DOT__COM~yyyy-mm-dd hh:mm:ss
        var key: String = keyworthyEmail
        key.append("~")
        key.append(defaultTimeZoneStr)
        
    //    print("key is \(key)")
        /*
        let usersRefs = Database.database().reference(withPath: "events")
        
        usersRefs.observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            
            if let allEvents = snapshot.value as? [String:Any] {
                for (eventKey,event) in allEvents {
                    
                    let evt = event as? [String:Any]
                    
                    //     print("eeeeeee: \(event) for event key \(eventKey)");
                    
                    let aps = evt!["applicants"];
                    print("the applicants arrrrrre \(aps)")
                    //       print("HOST HOST HOST")
                    //      print(host!);
                }}})
        */
        
        let eventsRef = Database.database().reference(withPath: "events")
        let oneEventRef = eventsRef.child(key)
        
        oneEventRef.observeSingleEvent(of: .value, with: { (snapshot) in
        //    print("GOT IT \(snapshot.value ?? "unknown applcnt")!")
            
        })
        
        
//        let oneEventsApplicantsRef = oneEventRef.child("applicants")
//        oneEventsApplicantsRef.observeSingleEvent(of: .value, with: { (snapshot) in
//                print("GOT IT \(snapshot.value ?? "unknown applcnt")!")
//            return snap;
//
//        })
        
        
        
       
        
        return nil
    }
    
    
    
    
    
    
    
    /* user is interested in this event */
    func applyFor(applicant: User, event: Event){
        
        
        
        
        
        
        
       // print("\(applicant.firstName) interested in \(event.title)")
        
        // update data model
        
        let emailOfHost = event.owner.emailAddress
        
    //    print("applying: \(applicant.emailAddress)")
        
        let keyworthyEmail = emailOfHost.replacingOccurrences(of: ".", with: "__DOT__")
        
        let startDateTime = event.startDateTime
        
    //    print("start date time is \(startDateTime)")
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let defaultTimeZoneStr = formatter.string(from: startDateTime)
        
        // firebase key is in format of:
        // email__DOT__COM~yyyy-mm-dd hh:mm:ss
        var key: String = keyworthyEmail
        key.append("~")
        key.append(defaultTimeZoneStr)
        
       
        var ev: Event = getEventByHostAndStartTime(
            hostEmailAddress: event.owner.emailAddress,
                   startTime:  event.startDateTime)!
        
     //   print("event applicants are \(ev.interestedUsers)")

        
        ev.interestedUsers?.append(applicant)
        
     //   print("NOW, event applicants are \(ev.interestedUsers)")

//
//
//       // print("THE KEY IS \(key)")
//
//
//        let usersRef = Database.database().reference(withPath: "events")
//        let amyRef = usersRef.child(key)
//        let amyBdRef = amyRef.child("emailaddress")
//        amyBdRef.observeSingleEvent(of: .value, with: { (snapshot) in
//        //    print("GOT IT \(snapshot.value ?? "unknown email")!")
//        })
//        //  amyBdRef.setValue("1999-12-31")
//
//        // return users[0]
//
//
//        // start actual function here
//
//        // get all applicants for this event
//        // and add this user too
//
//        let allEventsRef = Database.database().reference(withPath: "events")
//        let oneEventRef = allEventsRef.child(key)
//        let applicantsForOneEvent = oneEventRef.child("applicants")
//        applicantsForOneEvent.observeSingleEvent(of: .value, with: { (snapshot) in
//            //    print("GOT IT \(snapshot.value ?? "unknown email")!")
//            print("applicants are \(snapshot.value)")
//        })
//
        
        
        
        
        // end actual function here
        
        
    }
    
    
    
    func notInterestedIn(user: User, event: Event){
        print("\(user.firstName) not interested in \(event.title)")
    }
    
    
    
    
    
    
    
    func getUserByEmail(emailaddress: String) -> User{
        
        for i in 0 ..< self.users.count{
            if self.users[i].emailAddress == emailaddress{
               // print("found user")
                return self.users[i]
            }
        }
        
        
        return self.users[0];
    }
    
    
    
    //func getNextEvent(filters: [String:String]) -> Event{
    
    func createEvents(){
        
        
        let usersRef = Database.database().reference(withPath: "events")
        
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            
            if let allEvents = snapshot.value as? [String:Any] {
                for (eventKey,event) in allEvents {
                    
                    let evt = event as? [String:Any]
                    
               //     print("eeeeeee: \(event) for event key \(eventKey)");
                    
                    let host = evt!["host"];
                    
             //       print("HOST HOST HOST")
              //      print(host!);
                    
                    var relationshipSought: RelationshipType;
                    let relpType: String = evt!["relationshipType"] as! String
                    switch(relpType){
                    case "possiblyromantic":
                        relationshipSought = RelationshipType.PossiblyRomantic
                    case "romantic":
                        relationshipSought = RelationshipType.Romantic
                    case "friendship":
                        relationshipSought = RelationshipType.Friendship
                    case "anything":
                        relationshipSought = RelationshipType.Anything
                    default:
                //        print("invalid relationship type value")
                        relationshipSought = RelationshipType.Anything
                    }
                    
                    
                    var genderSought: Gender;
                    let genderBeingSought: String = evt!["lookingFor"] as! String
                    switch(genderBeingSought){
                    case "m":
                        genderSought = Gender.Male
                    case "f":
                        genderSought = Gender.Female
                    case "na":
                        genderSought = Gender.NotApplicable
                    default:
                 //       print("invalid gender type value")
                        genderSought = Gender.NotApplicable
                    }
                    
                    
                    var thePayer: Payer;
                    let payer: String = evt!["payer"] as! String
                    switch(payer){
                    case "free":
                        thePayer = Payer.Free
                    case "host":
                        thePayer = Payer.PosterPays
                    case "dutch":
                        thePayer = Payer.Dutch
                    case "guest":
                        thePayer = Payer.ApplicantPays
                    default:
                //        print("invalid gender type value")
                        thePayer = Payer.PosterPays
                    }
                    
                    let totalCADString: String = evt!["estTotalCAD"] as! String
                    let totalCAD: Int = Int(totalCADString)!
                    
                    let guestCADString: String = evt!["estGuestCAD"] as! String
                    let guestAmtCAD: Double = Double(guestCADString)!
                    let guestCAD: Int = Int(round(guestAmtCAD))
                    
                    let winner: String = evt!["guest"] as! String
                    
                    let desc: String = evt!["guest"] as! String
                    
                    
                    var endDT = evt!["endDateTime"] as! String
                    var startDT = evt!["startDateTime"] as! String
                  //  var postedDT = evt!["postedDateTime"] as! String
                    
                    
                 //   var calendar = Calendar.current
                    var dateComponents = DateComponents()
                    dateComponents.year = 2019
                    dateComponents.month = 2
                    dateComponents.day = 6
                    dateComponents.hour = 22
                    dateComponents.minute = 0
                    dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
                   // let end = calendar.date(from: dateComponents)
                    
                    
                    // Set date format
                    let dateFmt = DateFormatter()
                    // dateFmt.timeZone = NSTimeZone.defaultTimeZone()
                    dateFmt.dateFormat =  "yyyy-MM-dd HH:mm:ss"
                    
                    // Get NSDate for the given string
                    let dateEnd = dateFmt.date(from: endDT)
                    let dateStart = dateFmt.date(from: startDT)
                    let datePosted = dateFmt.date(from: startDT)
                    
                    // cut off trailing " +0000" six characters
                    endDT = (String)(endDT.prefix(19))
                    startDT = (String)(startDT.prefix(19))
                    
                    
                    //  print("DATE DATE DATE: \(dateEnd!)")
                    //  print("DATE DATE DATE: \(dateStart!)")
                    
                    
                    
                    
                    //   var applicants: [User] = [User]()
                    var apps: [String] = evt!["applicants"]! as! [String]
                    
                    
                    var usersInterestedInThisEvent: [User] = [User]()
                    
                    for i in 0 ..< apps.count{
                        
                        let email: String = apps[i]
                        
                   //     print("this user is interested in event: \(email)")
                        
                        let user: User = self.getUserByEmail(emailaddress: email)
                        usersInterestedInThisEvent.append(user)
                    }
                    
                    
                    //   var applicants: [User] = [User]()
                    var imageURLs: [String] = evt!["images"]! as! [String]
                    
                    //   var applicants: [User] = [User]()
                    var imageKeywords: [String] = evt!["imagekeywords"]! as! [String]
                    
                    
                    
                    var imagess: [Image] = [Image]()
                    
                    for i in 0 ..< imageURLs.count{
                        imagess.append(Image(keyword: imageKeywords[i] , urlString: imageURLs[i]))
                    }
                    
                    
                    
                    // print("HERE ARE APPS: \(apps)")
             //       print("the winner is \(winner)")
                    let chosenGuest: User = self.getUserByEmail(emailaddress: winner)
                    
                    let eventId: String = evt!["eventid"] as! String
                    let eventIdAsD: Double = Double(eventId)!
                    
                    let theID: Int = Int(round(eventIdAsD))
                    
                    
                    let ownerUser = self.getUserByEmail(emailaddress: host as! String)
                    
                    let e = Event(eventId: theID,
                                  title: evt!["title"] as! String,
                                  eventRelationshipType: relationshipSought,
                                  lookingFor: genderSought,
                                  estimatedCombinedTotalCostCAD: totalCAD,
                                  estimatedCostForGuestCAD: guestCAD,
                                  whoPays: thePayer,
                                  interestedUsers: usersInterestedInThisEvent,
                                  owner: ownerUser,//host as! User,
                                  chosenPartner: chosenGuest,
                                  images: imagess,
                                  location: nil,
                                  startDateTime: dateStart!,
                                  endDateTime: dateEnd!,
                                  postedDateTime: datePosted!,
                                  description: desc,
                                  imageKeywords: imageKeywords)
                    
                    self.events.append(e)
                    
                    for(theKey, field) in (event as? [String:Any])!{
              //          print("field is \(field) for key \(theKey)")
                        
                        
                        
                        
                        
                    }
                    
                    
                    // let userInterest = profile["Interest"]
                }
            }
            
            
            // let value = snapshot as? [NSDictionary]
      //      print("VALUE OF KEY IS \(snapshot.key)!")
            // print("found next event: \(title)")
            
        })
        
        // return events[currentEventNum];
        
        
    }
    
    
    
    
    
    func getNextEvent(filters: [String:String]) -> Event{
        //DEMO return just the fake events
      let event = demoEvents[currentEventNum%demoEvents.count]
        self.currentEventNum += 1
        return event
      
      
        let _: User = getUserFromFirebase(userId: 12)
        
        
   //     print("event number \(currentEventNum)")
        
        return self.events[self.currentEventNum % self.events.count] // need dictionary of options, plus keep track of current event
        
        
        
        
        
        
        
        
        
    }
    
    
    func getUser(userId: Int) -> User{
        createUsers()
        return self.users[0] // check userId field
    }
    
    
    func getFirstUserFromFirebase(userId: Int) -> User{
        
        let usersRef = Database.database().reference(withPath: "users").child("0")
        
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
   //         print("snapshot value is \(String(describing: snapshot.value))")
        //    if let userDict = snapshot.value as? [String : Any] {
                // print(userDict.debugDescription)
          //  }
        })
        return self.users[0]
        
    }
    
    
    
    func getArrayOfImages(subject: String , receiver: ImageReceiver){
        
        //    var feeds: [Image] = [Image]()
        //  var flickrURL: String = "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=3b801d634be562e16044124f4c11f184&tags="
        
        
        self.flickr.searchFlickr(for: subject) { searchResults in
            
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
   //         print("GOT IT \(snapshot.value ?? "unknown birthdate")!")
        })
        //  amyBdRef.setValue("1999-12-31")
        
        return self.users[0]
    }
    
    
    
    
    
    func getOwnerOf(event: Event) -> User{
        return self.users[0] // check owner field
    }
    
    func getApplicantsFor(event: Event) -> [User]{
        return [User]() // checking interestedUsers[] field
    }
    
    
}
