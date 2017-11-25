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
        let download = Download(resource: resource)
        download.task = downloadsSession.downloadTask(with: resource.resourceURL)
        download.task!.resume()
        download.isDownloading = true
        activeDownloads[download.resource.resourceURL] = download
    }
}
