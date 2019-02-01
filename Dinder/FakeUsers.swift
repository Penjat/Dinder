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
        
        var ims: [Image] = [Image]()
        let image1: Image = Image(name: "left profile", keyword: "spencer", urlString: "https://avatars1.githubusercontent.com/u/37875712?s=400&v=4")
        
        let image2: Image = Image(name: "right profile", keyword: "spencer p", urlString: "https://www.purina.co.uk/dogs/dog-breeds/library/dachsund-miniature-wire-haired")
        ims.append(image1)
        ims.append(image2)
        
        let spencer = User(userId: 0, firstName: "spencer", birthDate: bDate!, gender: Gender.Male, emailAddress: "pen@jat.com", mobilePhoneNumber: "7787090343", ratings: ratings, images: ims)
        
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
        
        
        
        
        var ims: [Image] = [Image]()
       
        
        let image1: Image = Image(name: "jason pix", keyword: "jj", urlString: "https://www.flickr.com/photos/photobysam123/6815273523/in/photolist-4M5Pbx-bof4nV-9xiifk-7NyHLz-3iNyHw-fZxyZ-8UtAdz-4M9ZzA-4M9Zsq-4M9Zq9-8u6oav-6Xua2q-4MJLCQ-7FAs7f-51X7YX-juTcFr-4M5PcX-4MJM2s-4M9Zr7-4MJLVJ-rRSza-4MJMmN-9dUCSa-eReGGz-8PvURV-6ZLcRu-7NCFZG-4M9ZqA-bkxveK-4M5Pgt-b6hNGv-6a7Q8o-4M9Zyb-2kzfpN-4MEzoR-4MJLkb-4MEzNa-4MEzxB-bgsCcM-9WNcRw-9XpbUW-3LQvw-7YjhGS-bgs4nZ-7TzmNg-7SL6Sv-4DU1tB-hWRsAG-4eYVVS-bgrGPt")
        ims.append(image1)
        
        
        
        
        let jason = User(userId: 1, firstName: "jason", birthDate: bDate!, gender: Gender.Male, emailAddress: "jasonharrisonvancouver@gmail.com", mobilePhoneNumber: "6043742456", ratings: ratings, images: ims)
        
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
        
        
        var ims: [Image] = [Image]()
        
        
        let image1: Image = Image(name: "jason pix", keyword: "jj", urlString: "https://www.flickr.com/photos/anjalisharma/6347682585/in/photolist-aEVwTc-5941Vu-55gc43-WHkHF9-52hYrP-aEVwqi-5vApm6-25PDsYZ-5raocj-55gcam-55bZgg-55gc73-9zKEK7-52hYoH-f1FWSR-ddAdXx-f1FSzt-Gn5k-82xdFn-aEZoDA-5jJUNg-dSbGG1-55bZcZ-aEZnSm-vvGTk-5mJB6J-aEVxFe-5mJBcC-5mEmZz-2HHMTj-8UP84z-5mEmWT-2HHN3Q-85CVoy-29hmns6-82XfW2-f1Wa3N-9Gxt4X-f1FRkv-VTzmuY-8g1ds7-UECGnS-VTzkh7-6Xspda-Rv9Yoo-7xfLi3-8UQKqT-SAjTup-6XwqaE-SxU9ho")
        ims.append(image1)
        
        
        let anjali = User(userId: 2, firstName: "anjali", birthDate: bDate!, gender: Gender.Female, emailAddress: "new@fie.com", mobilePhoneNumber: "911", ratings: ratings, images: ims)
        
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
        
        
        
        var ims: [Image] = [Image]()
        
        
        let image1: Image = Image(name: "cassie pix", keyword: "cass", urlString: "https://www.flickr.com/photos/roland64/15432597975/in/photolist-pvJ6Hr-5aWPsM-6Waap2-dMwbWf-6Wa8AF-5XdxYo-sRNeg-29PPrDf-6Wa6ze-6Wa5qB-6We8f9-586Vig-6We9xU-5v9oEN-5ZvjPM-6Wa7B8-6We8zy-5m42wM-83ncXS-FvdxM-86wPrt-QpQZsP-i3tbJ8-6YUc7E-RrRMwX-9em6vm-d9Y2rc-oGKEQH-daaizA-25SyAs-dEWzvC-5edYRX-7BUpeE-btyaqF-JaYWw4-5LC4Y6-jGE3v-a9GGLg-5BBNUu-6xrH4B-fUti5j-btxHkg-5PTzEF-a8tf76-2a87BKb-Fp1GcR-4DErJZ-a9Kuho-c1xpEh-6xrJbz")
        ims.append(image1)
    
        let image2: Image = Image(name: "summer 2018 pix", keyword: "cassandra", urlString: "https://www.flickr.com/photos/roland64/15429406381/in/photolist-pvrJXX-bjnrVK-7f3JZ6-9Ya5Zy-pvJ6Hr-5aWPsM-6Waap2-dMwbWf-6Wa8AF-5XdxYo-sRNeg-29PPrDf-6Wa6ze-6Wa5qB-6We8f9-586Vig-6We9xU-5v9oEN-5ZvjPM-6Wa7B8-6We8zy-5m42wM-83ncXS-FvdxM-86wPrt-QpQZsP-i3tbJ8-6YUc7E-RrRMwX-9em6vm-d9Y2rc-oGKEQH-daaizA-25SyAs-dEWzvC-5edYRX-7BUpeE-btyaqF-JaYWw4-5LC4Y6-jGE3v-a9GGLg-5BBNUu-6xrH4B-fUti5j-btxHkg-5PTzEF-a8tf76-2a87BKb-Fp1GcR")
        ims.append(image2)
        
        let image3: Image = Image(name: "whatever", keyword: "cass", urlString: "https://www.flickr.com/photos/himitsuhana/3497152549/in/photolist-6k2PBB-5EekAL-pvrJXX-bjnrVK-7f3JZ6-9Ya5Zy-pvJ6Hr-5aWPsM-6Waap2-dMwbWf-6Wa8AF-5XdxYo-sRNeg-29PPrDf-6Wa6ze-6Wa5qB-6We8f9-586Vig-6We9xU-5v9oEN-5ZvjPM-6Wa7B8-6We8zy-5m42wM-83ncXS-FvdxM-86wPrt-QpQZsP-i3tbJ8-6YUc7E-RrRMwX-9em6vm-d9Y2rc-oGKEQH-daaizA-25SyAs-dEWzvC-5edYRX-7BUpeE-btyaqF-JaYWw4-5LC4Y6-jGE3v-a9GGLg-5BBNUu-6xrH4B-fUti5j-btxHkg-5PTzEF-a8tf76")
        ims.append(image3)
        
        
        let cassandra = User(userId: 3, firstName: "cassandra", birthDate: bDate!, gender: Gender.Female, emailAddress: "casslyn30@gmail.com", mobilePhoneNumber: "7785490700", ratings: ratings, images: ims)
        
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
