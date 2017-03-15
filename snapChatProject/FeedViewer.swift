//
//  FeedViewer.swift
//  snapChatProject
//
//  Created by Ali Mousa on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class FeedViewer : UIViewController, UITableViewDelegate, UITableViewDataSource{
    var selectedIndex : IndexPath? = nil
    var initTime = Date()

    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        table.delegate = self
        table.dataSource = self
        tabBarController?.tabBar.isHidden = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return threads[threadNames[section]]!.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ImageViewController
        let img  = threads[threadNames[(selectedIndex?.section)!]]
        if (img != nil && segue.identifier == "viewImage") {
            dest.image = (img?[(selectedIndex?.row)!])!
        }
        dest.index = selectedIndex
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        performSegue(withIdentifier: "viewImage", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
        cell.feedName.text = indexPath.row.description
        cell.time.text = (Date().timeIntervalSince(initTime)).description
        cell.cellImageView?.image = #imageLiteral(resourceName: "unread")
        return cell
    }
    
    @IBAction func unwindToFeed(segue: UIStoryboardSegue){
        
    }
}
