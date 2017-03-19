//
//  FeedList.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation

final class FeedListController {
    
    var delegate: FeedListControllerDelegate?
    
    fileprivate let sourceReguest = SourceRequest()
    
    func getSources(){
        
        sourceReguest.getFeedList({ (source) in
            
        }) { (error) in
            
        }
    }
}
