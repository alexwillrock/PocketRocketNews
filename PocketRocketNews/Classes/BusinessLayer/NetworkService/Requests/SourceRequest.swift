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
    
    private let parser = XMLParser.fabrick()
    
    func getFeedList(_ complete:@escaping (_ result: Source?) -> Void,
                            failedBlock failed:@escaping (_ error: Error) -> Void){
    
        //let path = "http://rss.cnn.com/rss/edition.rss"
        
        let path = "http://www.aweber.com/blog/feed/"
        
        NetworkManager.request(at: path, with: .post, and: Parameters(), complete: { (response) in

            debugPrint(response ?? "")
            
            complete(self.parser.source(object: response?.data))
            
        }) { (error) in
            
            print(error.localizedDescription)
        }
    }
}
