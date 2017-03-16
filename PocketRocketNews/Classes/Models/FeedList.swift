//
//  FeedList.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation

struct FeedList {
    
    let items: [FeedItem]
    let source: Source
    
    init(items: [FeedItem], source: Source) {
        self.items = items
        self.source = source
    }
}
