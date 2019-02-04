//
//  UserFaker.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import CoreLocation




class FakeEvents: NSObject, CLLocationManagerDelegate{
    
    
    
    //var description: String
    
    var events: [Event]
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    
 
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
            print("\(lat),\(long)")
        } else {
            print("No coordinates")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    override init() {
        
        
        

        
        
        
        
       // print("init fake events")
        events = [Event]()
        
//        events.append(getBarMarijuanaWrestlingByJason())
//        events.append(getMetallicaGrouseGrindBySpencer())
//        events.append(getNailsDoneByCassandra())
//        events.append(getBowlingBySpencer())
        // make golf, dungeons and dragons, gym examples, change my breaks for $
        
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
        self.locationManager.startUpdatingLocation()
        events.append(getSkiingSpaKegByJason())
        events.append(getSeawallWalkByJason())
        events.append(getBarMarijuanaWrestlingByJason())
        events.append(getMetallicaGrouseGrindBySpencer())
        events.append(getNailsDoneByCassandra())
        events.append(getBowlingBySpencer())
        
    }
    
    func getSkiingSpaKegByJason() -> Event{
        
        let fakeUsers: FakeUsers = FakeUsers()
        let anjali: User = fakeUsers.getAnjali()
        let spencer: User = fakeUsers.getSpencer()
        let cassandra: User = fakeUsers.getCassandra()
        let jason: User = fakeUsers.getJason()
        
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
        
        
       // print(start!)
     //   print(end!)
        
        

        
        let currentLocation = self.locationManager.location
        
        let currentDateTime = Date()
        
        
        var images: [Image] = [Image]()
        let image1: Image = Image(keyword: "steak", urlString: "https://res.cloudinary.com/whistler/image/upload/w_500,c_scale,f_auto,dpr_3.0,q_auto/v1/images/hero/whistler-blackcomb-mountains-bc-canada.jpg")
        
        let image2: Image = Image(keyword: "skiing", urlString: "https://www.flickr.com/photos/cubagallery/13892714966/in/photolist-naDN9o-dEkunG-n2oLAQ-h1zoei-88qkTf-iDdo2D-iqoDNf-esbT85-edwix2-hnwqti-nwS7Vn-dSceGF-NBiWUV-CRNano-quRVQM-8tF7BU-C8xe2x-21BgYtb-23mWx8L-iBXaK8-dRNzkr-bnJHua-dkrH48-h1ynuW-cdtdm9-bpQM4p-cjBo4S-29Ya3bq-bVfRSx-DDnvj9-MGcKRH-8Hn2iT-PfHnSJ-bs7Ma4-ebzHYY-bnJD1x-bnj3uK-n2n3XH-21xf4J9-hnvhBS-bnj5Fr-fGWbxv-daYExN-2c2G4kw-bs7Gox-9xoqB4-23iHfEc-hnuNnp-f4dzJo-cRcVPf")
        
        let image3: Image = Image(keyword: "spa", urlString: "https://www.flickr.com/photos/73154039@N00/15294645804/in/photolist-pix4kJ-21UvBjN-pnW1xb-2e7uhK4-P15wpv-4RhekR-pDN3d1-87MkD6-87MkMF-o1jnZ3-axhoRX-q42DXL-87Qxwf-9xyJzY-rjKvUs-k4uTVk-atioCb-7PKSnG-9hp2Ph-VreWGL-bHaNHH-FGbJrE-Qgq7Bx-iocUoU-cjG7Nb-qQP6pW-gZBEWQ-2iUmXW-5SQiP-W1NZC2-ddWrSg-6QJrA-9hWupn-nLGj2G-7ZyTbg-4xGAVM-eWLPdC-moXnH1-5Wxswg-cTmYAd-moX6Hf-9hSBCT-5AMJo4-9y67ft-aCHG1K-9fU5qD-9rJ4Vw-kadje9-hJghmy-oYJwCT")
        
        
        
        images.append(image1)
        images.append(image2)
        images.append(image3)
        
        var keywords: [String] = [String]()
        keywords.append("snow")
        keywords.append("spa")
        keywords.append("steak")
      
        let event: Event = Event(eventId: 0,
                                 title: "snow, spa, and meat!",
                                 eventRelationshipType:  RelationshipType.PossiblyRomantic,
                                 lookingFor: Gender.Female,
                                 estimatedCombinedTotalCostCAD: 200,
                                 estimatedCostForGuestCAD: 0,
                                 whoPays: Payer.PosterPays,
                                 interestedUsers: usersInterested,
                                 owner: jason,
                                 chosenPartner: cassandra,
                                 images: images,
                                 location: currentLocation,
                                 startDateTime: start!,
                                 endDateTime: end!,
                                 postedDateTime: currentDateTime,
                                 description: "let's go to skiing at blackcomb, then the spa, and then the keg!!!", imageKeywords: keywords)
        
        return event
        
        
    }
    
    func getSeawallWalkByJason() -> Event {
        
        let fakeUsers: FakeUsers = FakeUsers()
        let anjali: User = fakeUsers.getAnjali()
        let cassandra: User = fakeUsers.getCassandra()
        let jason: User = fakeUsers.getJason()
        
        var usersInterested: [User] = [User]()
        usersInterested.append(anjali)
        usersInterested.append(cassandra)
        
        
        var calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 2
        dateComponents.day = 14
        dateComponents.hour = 12
        dateComponents.minute = 15
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let start = calendar.date(from: dateComponents)
        
        
        calendar = Calendar.current
        dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 2
        dateComponents.day = 14
        dateComponents.hour = 15
        dateComponents.minute = 15
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let end = calendar.date(from: dateComponents)
        
        
       // let currentLocation = self.locationManager.location

        
        
        let currentDateTime = Date()
        
        
        var images: [Image] = [Image]()
        let image1: Image = Image(keyword: "seawall", urlString: "https://northwesturbanist.files.wordpress.com/2014/09/dscn6827.jpg")
        
        let image2: Image = Image(keyword: "park", urlString: "https://northwesturbanist.files.wordpress.com/2014/09/dscn6827.jpg")
        
        
        
        
        images.append(image1)
        images.append(image2)
        
        var keywords: [String] = [String]()
        keywords.append("walk")
        keywords.append("ocean")
        
        
   
        let event: Event = Event(eventId: 1, title: "long walks by the ocean", eventRelationshipType: RelationshipType.Anything, lookingFor: Gender.NotApplicable, estimatedCombinedTotalCostCAD: 0, estimatedCostForGuestCAD: 0, whoPays: Payer.Free, interestedUsers: usersInterested, owner: jason, chosenPartner: nil, images: images, location: nil, startDateTime: start!, endDateTime: end!, postedDateTime: currentDateTime, description: "just want to go for a nice walk in this beautiful weather! talk, laugh, whatever!!", imageKeywords: keywords)
//
//
        
        
        
        return event
        
        
    }
    
    
    
    func getBarMarijuanaWrestlingByJason() -> Event{
        
        let fakeUsers: FakeUsers = FakeUsers()
       // let anjali: User = fakeUsers.getAnjali()
        //let cassandra: User = fakeUsers.getCassandra()
        let jason: User = fakeUsers.getJason()
        
        let usersInterested: [User] = [User]()
        
        
        var calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 3
        dateComponents.day = 1
        dateComponents.hour = 19
        dateComponents.minute = 00
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let start = calendar.date(from: dateComponents)
        
        
        calendar = Calendar.current
        dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 3
        dateComponents.day = 2
        dateComponents.hour = 00
        dateComponents.minute = 30
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let end = calendar.date(from: dateComponents)
        
        
        let currentLocation = self.locationManager.location

        
        
        let currentDateTime = Date()
        
        
        var images: [Image] = [Image]()
        let image1: Image = Image(keyword: "drinks", urlString: "https://static1.squarespace.com/static/5a08c690d0e628c973a94e63/5a99954e419202db743b0607/5a99954e419202db743b0613/1520014686321/01-partyhard.jpg")
        
        let image2: Image = Image( keyword: "dope", urlString: "https://www.flickr.com/photos/27675668@N03/8235557913/in/photolist-dxKorP-3VtXd-5So6M3-SARR-7dBNXV-eBfDdf-6brXLC-9xpnib-5aUKYZ-eSyJzb-HtUMi2-995cGb-6Ceahm-31Pw-7JCKGz-6wLo2X-7b4Puj-3bftXr-nPKXg-4v9zbC-dv1EgJ-9gSMSy-aVZFbP-48J3pY-nGkesk-2dapmpj-e1eGkZ-6Aeb23-RkGdEW-LTxfje-cE1ozh-fUhFxH-MQZmSz-45G82o-cvQNr7-6myypu-7heodd-4u8xvA-26MNmBk-MQZtRe-93VFPu-2cV2DMf-7ztBTi-2dPvMvF-awUh2Q-7MbqQs-9AVxrC-WjX4iP-9Vr3bt-8D2LiR")
        
        
        let image3: Image = Image(keyword: "wrestler", urlString: "https://www.flickr.com/photos/22265173@N02/2590934277/in/photolist-4WXduD-27ezMjr-5A7xja-26MJNs1-59wq9X-Ltyt87-8QXq1u-28BospF-28x2fa7-4qhtGs-7Y25FH-5vMgY8-6Puks5-4eow5h-4qhtVW-4sdji2-51G9X9-59wqak-4qdqhi-51G9a7-51BUpk-51BXK4-51BVA4-7Y5kpW-c6VPsu-51Gaau-51Gcp9-59ACUE-51Gc1W-51G7R3-51BUjD-51GbMd-6buazF-51G9x5-51G7mW-51G7hQ-51BXfr-bAcejP-sy5b5j-6aoG2p-6HX9MN-aVfeAp-8i9rHr-s2r4bA-5v1Dvv-byuuXh-9db8aK-c6VQxm-c6VPwh-c6VR3s")
        
        
        
        
        images.append(image1)
        images.append(image2)
        images.append(image3)
        
        var keywords: [String] = [String]()
        keywords.append("party")
       
        
        
        let event: Event = Event(eventId: 2, title: "let's get wild!", eventRelationshipType: RelationshipType.Friendship, lookingFor: Gender.Male, estimatedCombinedTotalCostCAD: 250, estimatedCostForGuestCAD: 125, whoPays: Payer.Dutch, interestedUsers: usersInterested, owner: jason, chosenPartner: nil, images: images, location: currentLocation, startDateTime: start!, endDateTime: end!, postedDateTime: currentDateTime, description: "party time central. let's party hard together", imageKeywords: keywords)
        
        
        
        
        
        return event
        
        
    }
    
    
    
    func getMetallicaGrouseGrindBySpencer() -> Event{
        
        let fakeUsers: FakeUsers = FakeUsers()
        //let anjali: User = fakeUsers.getAnjali()
        let spencer: User = fakeUsers.getSpencer()
        //let cassandra: User = fakeUsers.getCassandra()
        //let jason: User = fakeUsers.getJason()
        
        let usersInterested: [User] = [User]()
        //usersInterested.append(anjali)
        
        var calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 3
        dateComponents.day = 12
        dateComponents.hour = 16
        dateComponents.minute = 20
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let start = calendar.date(from: dateComponents)
        
        
        calendar = Calendar.current
        dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 3
        dateComponents.day = 12
        dateComponents.hour = 23
        dateComponents.minute = 30
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let end = calendar.date(from: dateComponents)
        
        
        let currentLocation = self.locationManager.location

        
        
        let currentDateTime = Date()
        
        
        var images: [Image] = [Image]()
        let image1: Image = Image(keyword: "grouse mountain", urlString: "https://fitt.co/vancouver/wp-content/uploads/sites/39/2018/06/@burlocker-grouse-grind-.jpg")
        
        let image2: Image = Image( keyword: "heavy metal", urlString: "https://www.flickr.com/photos/maquero/3204963645/in/photolist-5Tdh2T-oeCzDR-e93qKb-dG3rDQ-7sS6yD-2aZW9wD-7sS2i6-TdSL46-ocynVZ-5Tdh6g-HWNhAX-DPxqk1-23Rw1EW-qT7n5E-ocMzs1-7sVZUJ-qdJt21-e93qzQ-nYZAYY-65NrWS-pCjm-5ThBvw-8fvbwn-a1k7X9-a1k9Xy-GEGmjU-H1QpKR-7fFZvH-nYZK7c-pCji-64fkXz-nYZBfj-6quQ4P-79bx5v-7kmSB9-Hb85jj-21Pwv3J-dYUiGM-ZAY3Ua-DPxpw7-ogcAhF-ZAY1Rc-9dxCMj-52GivZ-8JQod5-7AGgZD-22PvNoy-e93q8b-vRKRHi-5VHN9j")
        
       
        
        
        
        
        images.append(image1)
        images.append(image2)
        
        var keywords: [String] = [String]()
        keywords.append("hiking")
        keywords.append("concert")
        
        
        
        let event: Event = Event(eventId: 3, title: "hike and rock", eventRelationshipType: RelationshipType.PossiblyRomantic, lookingFor: Gender.Male, estimatedCombinedTotalCostCAD: 400, estimatedCostForGuestCAD: 0, whoPays: Payer.PosterPays, interestedUsers: usersInterested, owner: spencer, chosenPartner: nil, images: images, location: currentLocation, startDateTime: start!, endDateTime: end!, postedDateTime: currentDateTime, description: "spend the day in the sunshine, then the night rocking out", imageKeywords: keywords)
        
        
        return event
    }
    
    
    
    
    func getNailsDoneByCassandra() -> Event{
        
        let fakeUsers: FakeUsers = FakeUsers()
        //let anjali: User = fakeUsers.getAnjali()
        let spencer: User = fakeUsers.getSpencer()
        let cassandra: User = fakeUsers.getCassandra()
        let jason: User = fakeUsers.getJason()
        
        var usersInterested: [User] = [User]()
        usersInterested.append(jason)
        usersInterested.append(spencer)
        
        
        var calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 2
        dateComponents.day = 14
        dateComponents.hour = 17
        dateComponents.minute = 00
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let start = calendar.date(from: dateComponents)
        
        
        calendar = Calendar.current
        dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 2
        dateComponents.day = 14
        dateComponents.hour = 18
        dateComponents.minute = 00
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let end = calendar.date(from: dateComponents)
        
        
        let currentLocation = self.locationManager.location

        
        
        let currentDateTime = Date()
        
        
        var images: [Image] = [Image]()
        let image1: Image = Image(keyword: "grouse mountain", urlString: "https://i.pinimg.com/originals/bf/f0/ed/bff0ede4aa8a5f5538a2ef82d7e66793.jpg")
      
        
        images.append(image1)
        
        var keywords: [String] = [String]()
        keywords.append("heart")
        keywords.append("hearts")
        keywords.append("manicure")
        
        
        let event: Event = Event(eventId: 4, title: "valentines nails!", eventRelationshipType: RelationshipType.PossiblyRomantic, lookingFor: Gender.Female, estimatedCombinedTotalCostCAD: 120, estimatedCostForGuestCAD: 10, whoPays: Payer.PosterPays, interestedUsers: usersInterested, owner: cassandra, chosenPartner: spencer, images: images, location: currentLocation, startDateTime: start!, endDateTime: end!, postedDateTime: currentDateTime, description: "nothing to do on valentine's day? let's talk and relax together. i have a gift certificate; you just pay the tip :)", imageKeywords: keywords)
        
        
        return event
    }
    
    
    
    func getBowlingBySpencer() -> Event{
        
        let fakeUsers: FakeUsers = FakeUsers()
        //let anjali: User = fakeUsers.getAnjali()
        let spencer: User = fakeUsers.getSpencer()
        //let cassandra: User = fakeUsers.getCassandra()
       //
        let usersInterested: [User] = [User]()
       
        
        var calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 2
        dateComponents.day = 5
        dateComponents.hour = 18
        dateComponents.minute = 45
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let start = calendar.date(from: dateComponents)
        
        
        calendar = Calendar.current
        dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 2
        dateComponents.day = 5
        dateComponents.hour = 20
        dateComponents.minute = 15
        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Japan Standard Time
        let end = calendar.date(from: dateComponents)
        
        
        let currentLocation = self.locationManager.location

        
        
        let currentDateTime = Date()
        
        
        var images: [Image] = [Image]()
        let image1: Image = Image(keyword: "ten pin", urlString: "https://www.gatewaychamber.com/Content/Uploads/Events/27bc68de-aede-47cc-a66e-bf6fa5eb2912.jpg")
        
        
        images.append(image1)
        
        var keywords: [String] = [String]()
        keywords.append("bowling")
        
        let event: Event = Event(eventId: 4, title: "bowl", eventRelationshipType: RelationshipType.Friendship, lookingFor: Gender.NotApplicable, estimatedCombinedTotalCostCAD: 40, estimatedCostForGuestCAD: 20, whoPays: Payer.Dutch, interestedUsers: usersInterested, owner: spencer, chosenPartner: nil, images: images, location: currentLocation, startDateTime: start!, endDateTime: end!, postedDateTime: currentDateTime, description: "let's bowl", imageKeywords: keywords)
        
        
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
