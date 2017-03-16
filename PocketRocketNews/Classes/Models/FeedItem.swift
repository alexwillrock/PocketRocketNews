//
//  FeedItem.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation

struct FeedItem {
    
    let link: URL
    let title: String
    let text: String
    let pubDate: Date
    let image: URL
    
    init(link: URL, title: String, text: String, pubDate: Date, image: URL) {
        self.link = link
        self.title = title
        self.text = text
        self.pubDate = pubDate
        self.image = image
    }  
}
