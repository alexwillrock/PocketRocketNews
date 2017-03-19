//
//  SWXMLParser.swift
//  PocketRocketNews
//
//  Created by Алексей on 18.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import AEXML

final class AEXMLParser: XMLParseService{
    
    func source(object: Data?) -> Source? {
        
//        guard let data = object else { return nil }
//        
//        let options = AEXMLOptions()
//    
//        do {
//            let xmlDoc = try AEXMLDocument(xml: data, options: options)
//            //print(xmlDoc.xml)
//
//            
//            for child in xmlDoc.root.children {
//                print(child["channel"].xml)
//                
//                
//               // print(child.xmlCompact)
//        
//            }
//            
//            print(xmlDoc.root["channel"].all)
//             print(xmlDoc.root["channel"]["title"].value)
//            //print(xmlDoc.root["channel"]["item"].xml)
//            
//            for child in xmlDoc.root["channel"]["item"].all!{
//                let description = child["description"].string
//                var result = description.firstImage() //"<img.*?src=\"([^\"]*)\"".firstMatchIn(string: description as NSString!, atRangeIndex: 1)
//                print(result)
//            }
//            
//        }catch{
//            
//            print("ошибка парсинга")
//            
//            return nil
//        }
        
        
        //let xmlDoc = try AEXMLDocument(xml: data, options: nil)
        
        
        return nil
    }
    
    func items(object: Data) -> FeedItem? {
        
        return nil
    }
}

