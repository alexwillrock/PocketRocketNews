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
    
    private let parser = SWXMLParser()
    
    func getFeedList(_ complete:@escaping (_ result: Source?) -> Void,
                            failedBlock failed:@escaping (_ error: Error) -> Void){
        
        NetworkManager.request(at: "http://www.aweber.com/blog/feed/", with: .post, and: Parameters(), complete: { (response) in

            complete(self.parser.source(object: response?.data))
            
        }) { (error) in
            
            print(error.localizedDescription)
        }
    }
}
