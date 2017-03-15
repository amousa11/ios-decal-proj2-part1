//
//  ImageFeedViewController.swift
//  snapChatProject
//
//  Created by Ali Mousa on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class ImageFeedViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    var img : UIImage? = nil
    var selectedIndex : IndexPath? = nil
    var add : String? = nil
    
    override func viewDidLoad() {
        table.delegate = self
        table.dataSource = self
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! feedTableViewCell
        cell.label.text = threadNames[indexPath.item]
        return cell as UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let ind = selectedIndex {
        table.cellForRow(at: ind)?.backgroundColor = UIColor.white
        }
        self.selectedIndex = indexPath
        table.cellForRow(at: indexPath)?.backgroundColor = UIColor.gray
        postingTo.text = threadNames[indexPath.item]
        add = threadNames[indexPath.item]
    }
    
    @IBAction func post(_ sender: UIButton) {
        threads[add!]?.append(img!)
        let alert = UIAlertController(title: "Post Success", message: "Post Successful", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            self.performSegue(withIdentifier: "toCollection", sender: self)
        }
        alert.addAction(OKAction)
        self.present(alert, animated: true) { 
            print("ok")
        }
    }
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet var postingTo: UILabel!
}
