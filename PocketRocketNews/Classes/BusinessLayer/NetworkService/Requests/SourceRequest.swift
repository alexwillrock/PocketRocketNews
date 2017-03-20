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
    
    func getFeedList(atPath path: String,  _ complete:@escaping (_ result: Source?) -> Void,
                            failedBlock failed:@escaping (_ error: Error) -> Void){
                    
        NetworkManager.request(at: path, with: .post, and: Parameters(), complete: { (response) in
            
            complete(self.parser.source(link: path, object: response?.data))
            
        }) { (error) in
            
            print(error.localizedDescription)
        }
    }
}
