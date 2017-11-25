//
//  PDFViewController.swift
//  Assignment
//
//  Created by Sai Pasumarthy on 25/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import UIKit
import WebKit

class PDFViewController: UIViewController {

    var resource: Resource?
    
    override func viewDidLoad() {        
        super.viewDidLoad()
         let pdfURL = Utility.localFilePath(for: (resource?.resourceURL)!)
            let data = try? Data(contentsOf: pdfURL)
            let webView = WKWebView()
            webView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(webView)

            let leadingConstraint = NSLayoutConstraint(item: webView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: webView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: webView, attribute: .topMargin, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: webView, attribute: .bottomMargin, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0)
            view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
            webView.load(data!, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
