//
//  User.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import Firebase



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
    
    
    //     let value = snapshot.value as? NSDictionary

    
    init?(snapshot: DataSnapshot) {
        
        print("inside user init with datasnapshot")
        
        guard
            let value = snapshot.value as? [String: String],
            
            let _ = value["userid"],
        let _ = value["firstname"],
        let _ = value["birthdate"],
        let _ = value["gender"],
        let _ = value["emailaddress"],
            let _ = value["mobilephonenumber"] else{
       // let Images
            
            print("UHOH")
          //  let name = value["name"] as? String,
         ///   let addedByUser = value["addedByUser"] as? String,
         //   let completed = value["completed"] as? Bool else {
                return nil
        }
        
        let oneJsonValue = snapshot.value as? [String:String]
        
        self.userId = Int(oneJsonValue!["userid"]!)!
        self.firstName = oneJsonValue!["firstname"]!
        
        
        
        var isoDate = oneJsonValue!["birthdate"]
        isoDate?.append("T00:00:00+0000")
      //  "2016-04-14T10:44:00+0000"
        
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from:isoDate!)!
        
        
        self.birthDate = date //oneJsonValue!["birthdate"]
        
        switch(oneJsonValue!["gender"]){
        case "not applicable":
            self.gender = Gender.NotApplicable
        case "male":
            self.gender = Gender.Male
        case "female":
            self.gender = Gender.Female
        default:
            self.gender = Gender.Female

            assert(false == true)
        }
        self.emailAddress = oneJsonValue!["emailaddress"]!
        
        self.mobilePhoneNumber = oneJsonValue!["mobilephonenumber"]
        self.ratings = [UserRating]()
        
        
    
        
        self.images = [Image]()//oneJsonValue.images
    
        
        print(self.emailAddress)
    }
    
    
    
    func jsonify(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    
    func toAnyObject() -> [String:String] {
        
        
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "yyyy-mm-dd" // MM
        // again convert your date to string
        let myStringafd:String = formatter.string(from: yourDate!)
        
        
        var gend: String
        
        switch(self.gender){
        case Gender.NotApplicable:
            gend = "not applicable"
        case Gender.Male:
            gend = "male"
        case Gender.Female:
            gend = "female"
        default:
            gend = "female"
            
            assert(false == true)
        }
        
        //let array = [ "one", "two" ]
        var imageUrls: [String] = [String]()
        for i in 0 ..< self.images.count{
            imageUrls.append(self.images[i].urlString)
        }
        
   
        
        
    //    print("\(json(from:imageUrls as Any))")
        
        let imageUrlsAsString = jsonify(from: imageUrls as [String])
        
        return [
            "userid": String(self.userId) as String,
            "firstname": self.firstName as String,
            "birthdate": myStringafd as String,
            "gender": gend as String,
            "emailaddress": self.emailAddress as String,
            "mobilephonenumber": self.mobilePhoneNumber!,
            "images": imageUrlsAsString! as String
            
        ]
    }
    
    
}
