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
        let image1: Image = Image(keyword: "spencer", urlString: "https://scontent-sea1-1.xx.fbcdn.net/v/t31.0-8/20248318_10159053975695503_7111814435368193392_o.jpg?_nc_cat=111&_nc_ht=scontent-sea1-1.xx&oh=c54ae4d947f35c98498049ae12fbff67&oe=5CEC288F")
        
        let image2: Image = Image(keyword: "spencer p", urlString: "https://scontent-sea1-1.xx.fbcdn.net/v/t31.0-8/11061009_788158704599660_285540594569830680_o.jpg?_nc_cat=111&_nc_ht=scontent-sea1-1.xx&oh=a1c157dff5f82ff7f65521f53afa5306&oe=5CF3E90B")
      let image3: Image = Image(keyword: "spencer p", urlString: "https://scontent-sea1-1.xx.fbcdn.net/v/t31.0-8/15541018_10157913742995503_8794559269374696503_o.jpg?_nc_cat=108&_nc_ht=scontent-sea1-1.xx&oh=1c694ada42cb73c5b850190abfb4bf7e&oe=5CF7F68F")
        ims.append(image1)
        ims.append(image2)
        ims.append(image3)
      
        let spencer = User(userId: 0, firstName: "spencer", birthDate: bDate!, gender: Gender.Male, emailAddress: "pen@jat.com", mobilePhoneNumber: "7787090343", ratings: ratings, images: ims)
        
        return spencer
        
        
    }
    
    func getJason() -> User{
        
        let calendar = Calendar.current
        
        
        var dateComponents = DateComponents()
        dateComponents.year = 1972
        dateComponents.month = 10
        dateComponents.day = 6
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
       
        
        let image1: Image = Image(keyword: "jj", urlString: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Jason_Momoa_by_Gage_Skidmore_2.jpg/266px-Jason_Momoa_by_Gage_Skidmore_2.jpg")
        ims.append(image1)
        
        let image2: Image = Image(keyword: "jjj", urlString: "https://akns-images.eonline.com/eol_images/Entire_Site/2018630/rs_600x600-180730133438-600-jason-momoa-073018.jpg?fit=around|700:700&crop=700:700;center,top&output-quality=90")
        ims.append(image2)
        
        let image3: Image = Image(keyword: "jjjj", urlString: "https://m.media-amazon.com/images/M/MV5BMTI5MTU5NjM1MV5BMl5BanBnXkFtZTcwODc4MDk0Mw@@._V1_.jpg")
        ims.append(image3)
        
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
        
        
        let image1: Image = Image(keyword: "jj", urlString: "https://assetsds.cdnedge.bluemix.net/sites/default/files/styles/big_2/public/feature/images/angelina_jolie_6.jpg?itok=oetopfVx")
        ims.append(image1)
        
        let image2: Image = Image(keyword: "jj", urlString: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/11/16/09/angelina-jolie.jpg")
        ims.append(image2)
        
        let image3: Image = Image(keyword: "jj", urlString: "https://s1.r29static.com//bin/entry/c98/720x864,80/1951955/image.jpg")
        ims.append(image3)
        
        
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
        
        
        let image1: Image = Image(keyword: "cass", urlString: "https://m.media-amazon.com/images/M/MV5BN2QzNTEwZjctMGM2My00OWQ5LWI4OGUtMmFjZWEwNGM1ZGIyXkEyXkFqcGdeQXVyMjAxMjU5MzM@._V1_.jpg")
        ims.append(image1)
    
        let image2: Image = Image(keyword: "cassandra", urlString: "https://miro.medium.com/max/2400/1*jGuzZCseMpFtkQPadQbmGg@2x.jpeg")
        ims.append(image2)
        
        let image3: Image = Image(keyword: "cass", urlString: "http://tonypratt.com/wp-content/uploads/Maria-Cassandra-8.31.2010_04811.jpg")
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
