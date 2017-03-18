//
//  SourceRequest.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import Alamofire
import SWXMLHash

struct SourceRequest: Request {
    
    static func getFeedList(){
        
        NetworkManager.request(at: "http://www.aweber.com/blog/feed/", with: .post, and: Parameters(), complete: { (response) in
            
            let xml = SWXMLHash.config {
                config in
                config.shouldProcessLazily = true
                }.parse(response.data!)
            
            do {
                
                for item in xml["rss"]["channel"]["item"] {
                    //print(item.all)
                    print(item["title"].element?.text)
                }
                
            }catch{
                
            }
    
            
        }) { (error) in
            
        }
    }
}
