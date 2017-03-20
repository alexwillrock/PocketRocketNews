//
//  SWXMLParser.swift
//  PocketRocketNews
//
//  Created by Алексей on 18.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import AEXML

final class AEXMLParser: XMLParseService {
    
    func source(link: String, object: Data?) -> Source? {
        
        guard let data = object else {
            return nil
        }
        
        let options = AEXMLOptions()
        do {
            
            let xmlDoc = try AEXMLDocument(xml: data, options: options)
            
            guard let name = xmlDoc.root["channel"]["title"].value else {
                print("не удалось преобразовать title")
                return nil
            }
            
            let myItems = items(object: xmlDoc.root["channel"]["item"].all)
            
            return Source(name: name, link: URL(string: link), date: Date(), items: myItems)
            
        } catch {
            
            print("не удалось отобразить ленту")
            return nil
        }
    }
    
    private func items(object: [AEXMLElement]?) -> [FeedItem] {
        
        var feedItems = [FeedItem]()
        
        guard let items = object else {
            print("фиды не найдены")
            return feedItems
        }
        
        for item in items{
            
            let text = item["description"].string
            let title = item["title"].string
            let image = item["description"].string.firstImage()
            let pubDate = item["pubDate"].string.rssDate()
            
            feedItems.append(FeedItem(title: title, text: text, pubDate: pubDate, image: image))
            
        }
        return feedItems
    }
}

