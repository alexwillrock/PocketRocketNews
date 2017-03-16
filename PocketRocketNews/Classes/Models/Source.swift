//
//  Source.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation

struct Source {
    
    let name: String
    let link: URL
    
    init(name: String, link: URL) {
        self.name = name
        self.link = link
    }
    
}
