//
//  Request.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation

enum URLMethod: String{
    
    case POST = "POST"
    case GET = "GET"
}

protocol Request {
    
    var params: NSDictionary { get }
    var path: NSString { get }
    var method: URLMethod { get }
    
    init(withParams params: NSDictionary, path: NSString, method: URLMethod)
    
}
