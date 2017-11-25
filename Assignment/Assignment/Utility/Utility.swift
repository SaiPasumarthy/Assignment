//
//  Utility.swift
//  Assignment
//
//  Created by Sai Pasumarthy on 24/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import Foundation

class Utility {
    // Get local file path: download task stores tune here; AV player plays it.
    class func localFilePath(for url: URL) -> URL {
        // Sharing with other apps with same app group identifier
        let documentsPath = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.sparklertechies.assignment")
        return documentsPath!.appendingPathComponent(getQueryStringParameter(url: url, param: "id")!)
    }
    
    class func getQueryStringParameter(url: URL, param: String) -> String? {
        guard let url = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
}
