//
//  SourceRequest.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import Alamofire

struct SourceRequest: Request {
    
    static func getFeedList(){
        
        NetworkManager.request(at: "https://ria.ru/docs/about/rss/", with: .post, and: Parameters(), complete: {
            
        }) { 
            
        }
    }
}
