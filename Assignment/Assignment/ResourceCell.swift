//
//  ResourceCell.swift
//  Assignment
//
//  Created by Sai Pasumarthy on 23/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import UIKit

protocol ResourceCellDelegate {
    func downloadTapped(_ cell: ResourceCell)
}

class ResourceCell: UITableViewCell {
    // Delegate identifies download action,
    // then passes this to a download service method.
    var delegate: ResourceCellDelegate?
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var resourceTitleLabel: UILabel!
    @IBOutlet weak var resourceDownloadButton: UIButton!
    
    //MARK:- IBActions
    @IBAction func downloadResource(_ sender: Any) {
        delegate?.downloadTapped(self)
    }
    
    func configure(resource: Resource, downloaded: Bool, download: Download?) {
        switch resource.resourceIndex {
        case 4:
            resourceTitleLabel.text = "PDF"
        case 5:
            resourceTitleLabel.text = "Video"
        default:
            resourceTitleLabel.text = "Image"
        }
        var showDownloadControls = false
        // Non-nil Download object means a download is in progress
        if let download = download {
            showDownloadControls = true
            let title = download.isDownloading ? "Downloading..." : "Download"
            resourceDownloadButton.setTitle(title, for: .normal)
        }
        progressBar.isHidden = !showDownloadControls
        progressLabel.isHidden = !showDownloadControls
        // If the resource is already downloaded, enable cell selection and hide the Download button
        selectionStyle = downloaded ? UITableViewCellSelectionStyle.gray : UITableViewCellSelectionStyle.none
        resourceDownloadButton.isHidden = downloaded
    }
    
    func updateDisplay(progress: Float, totalSize : String) {
        progressBar.progress = progress
        progressLabel.text = String(format: "%.1f%% of %@", progress * 100, totalSize)
    }
}
