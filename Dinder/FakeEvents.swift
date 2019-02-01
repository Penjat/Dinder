//
//  UserFaker.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import CoreLocation

struct FakeEvents{
    var events: [Event] = [Event]()
    
    init() {
        events.append(getChessKegByJason())

    }
    
    func getChessKegByJason() -> Event{
        
        var fakeUsers: FakeUsers = FakeUsers()
        var anjali: User = fakeUsers.getAnjali()
        var spencer: User = fakeUsers.getSpencer()
        var cassandra: User = fakeUsers.getCassandra()
        var jason: User = fakeUsers.getJason()
        
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
        
        
        var locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locManager.location
            
        }
        
        
        let currentDateTime = Date()

        
        var images: [Image] = [Image]()
        let image1: Image = Image(name: "beef", keyword: "steak", urlString: "https://www.flickr.com/photos/bour3/9443020670/in/photolist-forX4d-99BFkQ-6o3Ldt-7WCwYk-aCQPLt-cFqAum-cKXNt3-6KfPid-8SagDg-7JE9Tv-6Wyspb-efEPbz-8QyXqg-75c66M-bNaBkv-S4L9E-5oG9JC-3bmwBb-4teyZk-cFqFKj-bUd668-WUJC-79yD7U-5oBSVX-87De3k-5x3uQG-mGNZM-5VM9Mg-GCpLne-3qs2zV-kbieWp-no23d-rroprj-6Wyt25-9M6m73-bvVba6-8YUqGg-forUmJ-4ToTgF-7UNc5S-deehnL-8KK1BM-2TmnMh-5P9pQ-a5CkvE-Smkmqh-5JM1Cz-djZMRZ-9JJ1T5-amhjY5")
        
        let image2: Image = Image(name: "whistler", keyword: "skiing", urlString: "https://www.flickr.com/photos/cubagallery/13892714966/in/photolist-naDN9o-dEkunG-n2oLAQ-h1zoei-88qkTf-iDdo2D-iqoDNf-esbT85-edwix2-hnwqti-nwS7Vn-dSceGF-NBiWUV-CRNano-quRVQM-8tF7BU-C8xe2x-21BgYtb-23mWx8L-iBXaK8-dRNzkr-bnJHua-dkrH48-h1ynuW-cdtdm9-bpQM4p-cjBo4S-29Ya3bq-bVfRSx-DDnvj9-MGcKRH-8Hn2iT-PfHnSJ-bs7Ma4-ebzHYY-bnJD1x-bnj3uK-n2n3XH-21xf4J9-hnvhBS-bnj5Fr-fGWbxv-daYExN-2c2G4kw-bs7Gox-9xoqB4-23iHfEc-hnuNnp-f4dzJo-cRcVPf")
        
        let image3: Image = Image(name: "scandanavian spa", keyword: "spa", urlString: "https://www.flickr.com/photos/73154039@N00/15294645804/in/photolist-pix4kJ-21UvBjN-pnW1xb-2e7uhK4-P15wpv-4RhekR-pDN3d1-87MkD6-87MkMF-o1jnZ3-axhoRX-q42DXL-87Qxwf-9xyJzY-rjKvUs-k4uTVk-atioCb-7PKSnG-9hp2Ph-VreWGL-bHaNHH-FGbJrE-Qgq7Bx-iocUoU-cjG7Nb-qQP6pW-gZBEWQ-2iUmXW-5SQiP-W1NZC2-ddWrSg-6QJrA-9hWupn-nLGj2G-7ZyTbg-4xGAVM-eWLPdC-moXnH1-5Wxswg-cTmYAd-moX6Hf-9hSBCT-5AMJo4-9y67ft-aCHG1K-9fU5qD-9rJ4Vw-kadje9-hJghmy-oYJwCT")
        
        
        
        images.append(image1)
        images.append(image2)
        images.append(image3)
        
        
//
//        label1.text = "\(currentLocation.coordinate.longitude)"
//        label2.text = "\(currentLocation.coordinate.latitude)"
//
//
        let event: Event = Event(eventId: 0, title: "Brains and Beef", eventRelationshipType: RelationshipType.PossiblyRomantic, lookingFor: Gender.Female, estimatedCombinedTotalCostCAD: 200, estimatedCostForGuestCAD: 0, whoPays: Payer.PosterPays, interestedUsers: usersInterested, owner: jason, chosenPartner: cassandra, images: images, location: currentLocation, startDateTime: start!, endDateTime: end!, postedDateTime: currentDateTime, description: "let's go to skiing at blackcomb, then the spa, and then the keg!!!")
        
        
        
      
        
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
