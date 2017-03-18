//
//  NetworkManager.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit
import Alamofire

final class NetworkManager {

    class func request(at path: String,  with method:HTTPMethod, and params: Parameters, complete:@escaping (_ result: DefaultDataResponse?) -> Void, failedBlock failed:@escaping (_ error: Error) -> Void) {

        var headers = HTTPHeaders()
        headers["Content-Type"] = " application/rss+xml"
        
        Alamofire.request(path, method: method, parameters: params).response { (response) in
            if let error = response.error {
               failed(error)
            }
            else{
                complete(response)
            }
        }
    }
}
