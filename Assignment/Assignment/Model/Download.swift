//
//  Download.swift
//  Assignment
//
//  Created by Sai Pasumarthy on 23/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import Foundation

class Download {
    
    var resource: Resource
    init(resource: Resource) {
        self.resource = resource
    }
    
    // Download service sets these values:
    var task: URLSessionDownloadTask?
    var isDownloading = false
    
    // Download delegate sets this value:
    var progress: Float = 0
    
}
