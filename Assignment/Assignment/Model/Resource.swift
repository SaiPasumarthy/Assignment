//
//  Resource.swift
//  Assignment
//
//  Created by Sai Pasumarthy on 23/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import Foundation

class Resource {
    let resourceURL: URL
    let resourceIndex: Int
    var downloaded = false
    
    init(resourceURL: URL, resourceIndex: Int) {
        self.resourceURL = resourceURL
        self.resourceIndex = resourceIndex
    }
}
