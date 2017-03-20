//
//  XMLParseService.swift
//  PocketRocketNews
//
//  Created by Алексей on 18.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation

protocol XMLParseService {
    
    func source(link: String, object: Data?) -> Source?
}

struct XMLParser{
    
    static func fabrick() -> XMLParseService{
        return AEXMLParser()
    }
}
