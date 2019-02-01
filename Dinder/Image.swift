//
//  Image.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation

struct Image{
    
    let name: String
    let keyword: String
    let urlString: String
    
    init(name: String, keyword: String, urlString: String) {
        self.name = name
        self.keyword = keyword
        self.urlString = urlString
        
    }
    
}
