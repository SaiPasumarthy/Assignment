//
//  ImageViewController.swift
//  Assignment
//
//  Created by Sai Pasumarthy on 23/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var resourceImage: UIImageView!
    var resource: Resource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageData = try? Data(contentsOf: Utility.localFilePath(for: (resource?.resourceURL)!))
        self.resourceImage.image = UIImage(data: imageData!)
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
