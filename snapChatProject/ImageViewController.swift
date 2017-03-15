//
//  ImageViewController.swift
//  snapChatProject
//
//  Created by Ali Mousa on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController : UIViewController {
    var index :IndexPath? = nil
    var image : UIImage = UIImage()
    @IBOutlet var imageView: UIImageView? = nil
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
        imageView?.image = image
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func pressed(_ sender: UIButton) {
        tabBarController?.tabBar.isHidden = false
        performSegue(withIdentifier: "toFeed", sender: self)
    }
}
