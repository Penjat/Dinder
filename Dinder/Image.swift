//
//  Image.swift
//  Dinder
//
//  Created by jason harrison on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import UIKit

class Image{
    
    let keyword: String?
    let urlString: String
    var uiImage: UIImage? = nil
    
    init(keyword: String, urlString: String) {
        self.keyword = keyword
        self.urlString = urlString
    }
    
}
