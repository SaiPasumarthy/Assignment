//
//  DownloadService.swift
//  Assignment
//
//  Created by Sai Pasumarthy on 23/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import Foundation

class DownloadService {
    
    var downloadsSession: URLSession!
    var activeDownloads: [URL: Download] = [:]
    
    // MARK: - Download methods called by ResourceCell delegate methods
    
    func startDownload(_ resource: Resource) {
        // 1
        let download = Download(resource: resource)
        // 2
        download.task = downloadsSession.downloadTask(with: resource.resourceURL)
        // 3
        download.task!.resume()
        // 4
        download.isDownloading = true
        // 5
        activeDownloads[download.resource.resourceURL] = download
    }
}
