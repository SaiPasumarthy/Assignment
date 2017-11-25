//
//  ListViewController.swift
//  Assignment
//
//  Created by Sai Pasumarthy on 23/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    
    var resourceArray: [Resource] = []
    let downloadService = DownloadService()
    // Create downloadsSession here, to set self as delegate
    lazy var downloadsSession: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "com.sparklertechies.bgSessionConfiguration")
        configuration.sharedContainerIdentifier = "group.sparklertechies.assignment"
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.tableFooterView = UIView()
        loadResourceArrar()
        downloadService.downloadsSession = self.downloadsSession
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playDownload(_ resource: Resource) {
        let videoURL =  Utility.localFilePath(for: resource.resourceURL)
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ImageViewController" {
            if let imageVC = segue.destination as? ImageViewController,
                let resource = sender as? Resource {
                imageVC.resource = resource
            }
        } else if segue.identifier == "PDFViewController" {
            if let pdfVC = segue.destination as? PDFViewController,
                let resource = sender as? Resource {
                pdfVC.resource = resource
            }
        }
    }
    

}

extension ListViewController {
    private func loadResourceArrar() {
        resourceArray.append(Resource(resourceURL: URL(string: "https://clientarea.indegene.com/sharemax/retrieve.jsp?id=fd7b185a-58e7-4e1f-9870-654736d9fa2d")!, resourceIndex: 0, resourceType: .image))
        resourceArray.append(Resource(resourceURL: URL(string: "https://clientarea.indegene.com/sharemax/retrieve.jsp?id=23d93642-0b6c-40fd-9ca2-d4b5d3a930c8")!, resourceIndex: 1, resourceType: .image))
        resourceArray.append(Resource(resourceURL: URL(string: "https://clientarea.indegene.com/sharemax/retrieve.jsp?id=93ac5b8a-69c1-44cd-803d-81701176ba3e")!, resourceIndex: 2, resourceType: .image))
        resourceArray.append(Resource(resourceURL: URL(string: "https://clientarea.indegene.com/sharemax/retrieve.jsp?id=93d64af9-d43e-4d83-8786-f20d7c78fe17")!, resourceIndex: 3, resourceType: .image))
        resourceArray.append(Resource(resourceURL: URL(string: "https://clientarea.indegene.com/sharemax/retrieve.jsp?id=eeda377a-aecb-4a22-8180-4214f5983967")!, resourceIndex: 4, resourceType: .pdf))
        resourceArray.append(Resource(resourceURL: URL(string: "https://clientarea.indegene.com/sharemax/retrieve.jsp?id=462688db-ad8d-405d-a823-bb9824a2c912")!, resourceIndex: 5, resourceType: .video))
    }
}


// MARK: - UITableView

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResourceCell = tableView.dequeueReusableCell(for: indexPath)
        
        // Delegate cell button tap events to this view controller
        cell.delegate = self
        let resource = resourceArray[indexPath.row]
        cell.configure(resource: resource, downloaded: resource.downloaded, download: downloadService.activeDownloads[resource.resourceURL])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    // When user taps cell, play the local file, if it's downloaded
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resource = resourceArray[indexPath.row]
        if resource.downloaded {
            switch resource.resourceType {
            case .image:
                self.performSegue(withIdentifier: "ImageViewController", sender: resource)
            case .pdf:
                self.performSegue(withIdentifier: "PDFViewController", sender: resource)
            case .video:
                playDownload(resource)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - ResourceCellDelegate
// Called by track cell to identify resource for index path row,
// then pass this to download service method.
extension ListViewController: ResourceCellDelegate {
    func downloadTapped(_ cell: ResourceCell) {
        if let indexPath = listTableView.indexPath(for: cell) {
            let resource = resourceArray[indexPath.row]
            downloadService.startDownload(resource)
            reload(indexPath.row)
        }
    }
    // Update track cell's buttons
    func reload(_ row: Int) {
        listTableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
    }
    
}
