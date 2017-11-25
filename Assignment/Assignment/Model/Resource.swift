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
    var resourceType: ResourceType
    
    init(resourceURL: URL, resourceIndex: Int, resourceType: ResourceType) {
        self.resourceURL = resourceURL
        self.resourceIndex = resourceIndex
        self.resourceType = resourceType
    }
}
