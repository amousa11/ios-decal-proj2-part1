//
//  Struct.swift
//  snapChatProject
//
//  Created by Ali Mousa on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit
struct Section {
    
    var heading : String
    var items : [UIImage]
    
    init(title: String, objects : [UIImage]) {
        
        heading = title
        items = objects
    }
    
}
