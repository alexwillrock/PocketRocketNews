//
//  SWXMLParser.swift
//  PocketRocketNews
//
//  Created by Алексей on 18.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import SWXMLHash

final class SWXMLParser: XMLParseService{

    func source(object: Data?)  -> Source? {
        
        guard let data = object else {
            return nil
        }
        
        let xml = SWXMLHash.config {
            config in
            config.shouldProcessLazily = true
            }.parse(data)

        let channel = xml["rss"]["channel"]
        
        let linkStr = channel["atom:link"].element?.attribute(by: "href")?.text
        let title = channel["title"].element?.text
        print(linkStr ?? "")
        print(title ?? "")
        
        return nil
    }
    
    func items(object: Data) -> FeedItem? {
        
        return nil
    }
}
