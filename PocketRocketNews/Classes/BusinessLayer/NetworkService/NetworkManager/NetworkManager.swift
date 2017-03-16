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

    class func request(at path: String,  with method:HTTPMethod, and params: Parameters, complete:() -> Void, failedBlock failed:() -> Void) {

        Alamofire.request(path, method: method, parameters: params).response { (response) in
            debugPrint(response)
        }
    }
}
