
//
//  File.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation

struct UserRating{
    
    let userRatingCategory: UserRatingCategory
    let positiveReview: Bool
    let comment: String
    let reviewer: User

    init(userRatingCategory: UserRatingCategory, positiveReview: Bool, comment: String, reviewer: User) {
        self.userRatingCategory = userRatingCategory
        self.positiveReview = positiveReview
        self.comment = comment
        self.reviewer = reviewer
    }
  
}
