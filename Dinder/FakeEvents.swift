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
        let image1: Image = Image(keyword: "steak", urlString: "https://www.flickr.com/photos/bour3/9443020670/in/photolist-forX4d-99BFkQ-6o3Ldt-7WCwYk-aCQPLt-cFqAum-cKXNt3-6KfPid-8SagDg-7JE9Tv-6Wyspb-efEPbz-8QyXqg-75c66M-bNaBkv-S4L9E-5oG9JC-3bmwBb-4teyZk-cFqFKj-bUd668-WUJC-79yD7U-5oBSVX-87De3k-5x3uQG-mGNZM-5VM9Mg-GCpLne-3qs2zV-kbieWp-no23d-rroprj-6Wyt25-9M6m73-bvVba6-8YUqGg-forUmJ-4ToTgF-7UNc5S-deehnL-8KK1BM-2TmnMh-5P9pQ-a5CkvE-Smkmqh-5JM1Cz-djZMRZ-9JJ1T5-amhjY5")
        
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
        let image1: Image = Image(keyword: "seawall", urlString: "https://www.flickr.com/photos/cisley/265415579/in/photolist-GuW34m-ckQo5C-6rKp4t-psjNF-TNJNtD-buzMr4-J8Bjs-fRVodC-bHiqG-6Gkyjv-QHdR9v-7AunEV-Vh6vaW-5Vfsg2-4R3LNf-FD3evV-S9DEc-5bNsr-6FViog-6BvfMD-6FVEF6-9eas2w-bmZE45-6Ry8CX-esLtg-dQASfJ-6Bvh5a-98YbXJ-5sL1cV-3cBzVQ-rh8YW7-eoj8si-xsHTK-27CkcCp-9sFmEm-ymma2-CD9S2x-5RgWLT-sDFMuf-eyPqe4-9BkVvN-ku79kQ-UAJ2Zy-VDXZLW-6Ak2jr-6rNF9S-HHsUeS-3C9L7F-29AuqZn-jv1HhB")
        
        let image2: Image = Image(keyword: "park", urlString: "https://www.flickr.com/photos/dingoshoes/14529929430/in/photolist-o8XFNE-bvZV6V-2dSuVKF-UYp3HR-7TWrr8-jv2ZZk-Vh5EDg-bLU9yp-poGgvp-2cifBcW-jJBSiq-7beeeR-pAnRGn-nuQbgw-XwL4S7-foj948-cq7dk9-4cMcby-6YcXUc-5PyFbq-pojasx-oWBsQf-5AyTni-kW9jDA-4cMcfb-3S9TC1-eBSXQT-pTCYkN-oc2i6P-47os1A-eaxUXZ-ng8uNA-ekFY35-h3jFY5-7ktKgK-GmdhFv-24J8eWL-4cMcxL-pYBw5A-8ffH-4kcDW6-7ebvK8-RW9Bwm-4C6aCz-4cHcYD-gwxZLe-or8dt3-q6B2ai-4kcE1K-WPz3bQ")
        
        
        
        
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
        let image1: Image = Image(keyword: "drinks", urlString: "https://www.flickr.com/photos/iskigabor/5680916410/in/photolist-9E1bwE-97RtLf-5fpBo8-ac7J1Z-d1c4Ly-rqv3MB-bpqbSn-fdH6oM-95x5gg-brBZjP-9uU9tD-pkTPWz-4XmHtc-3JKePr-58Tp4g-qwy5kR-gu1Qkp-SiQT-4Nw48y-7uBQXR-679YrB-dUzyrS-cic245-dUzygE-8mRPN8-9aRVMm-8JhSxX-6vL6ND-4FmQe5-6wvFGA-6y62sC-be66QX-bnFtBV-4Fjxd1-pAZe1p-7WqyNa-akFvvP-fMww66-fqz3gX-71FeWJ-9SjEkK-UedhF-E7vGCY-bB5Ark-pC3ErL-4Bq5aP-r5MyPt-7uAePD-87rrMv-f6zk65")
        
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
        let image1: Image = Image(keyword: "grouse mountain", urlString: "https://www.flickr.com/photos/zeeyolqpictures/12239163493/in/photolist-jDwUUe-4wdjE8-awfwGV-dmwNFb-nAeGnd-bFEbse-fDUCiQ-oBZ5Wf-gChLRE-bFEaMe-9C8zq3-7hZUtP-qS6h8v-aH8vga-oci1CP-e7ZNWq-8Frh4k-c34sd3-7Ddwi5-9sNqR8-cjxHsS-7XPbaF-5ggJGo-hB9KV6-v6hYDN-fbbXhu-diZVkB-9U5yYp-e5SARz-vFNUW6-avWfpa-a4Bpij-dUz2JT-87QC6E-eXaimd-964D56-tC1NC7-jKSA4V-b4u3ZT-e4JKyV-5tLxV2-2dTNZjJ-ayix6t-onGf5M-YNEAp5-oaeu8j-qBxPnU-DSJ32k-rUf3nA-v7T2uh")
        
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
        let image1: Image = Image(keyword: "grouse mountain", urlString: "https://www.flickr.com/photos/96694840@N08/8878806621/in/photolist-ewAcSM-ewDobf-54rJDY-ewDohm-mbu3x2-rHfozD-egWAcv-3TTG2R-8rT8o9-7HAsms-of9D6G-3iisq-6BaQzX-5Dfu8W-dJcJL-7HAsiG-5DfuEC-3ja69U-23qqJd-5Dbcvn-4YaHEk-9GG6r-3j4vbP-3mCb-38DjA-eeGFGs-e7KrMk-e3A3d1-b2fnqx-dWVXgE-ap8nn5-8T1aUA-bwLt3K-4dtsh-5Bm4ob-dWQgHx-4hxJq4-G1f4C-4dtsx-bbj5AK-4eSXy-6PnKA7-8YHiTG-8TSoX5-4AgpWm-NV7PFN-vEjsVE-5GKduh-GFY1w-H3S38")
      
        
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
        let image1: Image = Image(keyword: "ten pin", urlString: "https://www.flickr.com/photos/sidtysmith/23720892673/in/photolist-C98LYa-2DVun8-4PdbwL-bqL89U-a6x4QU-9equx3-86Hc67-6pWBNZ-57fpjW-7Adp9t-696NGb-95uhrA-drpxEx-qmxgF9-8MKAoi-9yAgy5-8o44ir-5wmskS-9ZLubA-aguyFz-7A4utt-9SGnHp-bJ78Qp-95uhW9-3hN6qZ-9hhcf7-cqCsP-9ZHBFH-9g1g9P-95ugq1-54bw8u-9g4nvd-8MBCFK-u4FWE-86DZYF-4phhd8-ama2nq-am7cJD-51M6te-95ufEf-4PRmLN-5RNkmD-7Q8Wvv-7u4Dcc-88UrpD-be3rka-4jKV3z-9SGqAt-wh1eU-4XYm3G")
        
        
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
