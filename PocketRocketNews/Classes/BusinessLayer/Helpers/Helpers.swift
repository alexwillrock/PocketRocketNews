//
//  Helpers.swift
//  PocketRocketNews
//
//  Created by Алексей on 19.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation


extension String {
    
    func firstImage() -> URL?{
        
        let pattern = "<img.*?src=\"([^\"]*)\""
        
        do{
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            guard let match = regex.firstMatch(in: self, options: .withoutAnchoringBounds, range: NSMakeRange(0, self.characters.count))
                else{
             return nil
            }
            
            let imageStr = (self as NSString).substring(with: match.rangeAt(1))
            
            return URL(string: imageStr)
            
        }catch{
         
            print("не удалось преобразовать строку \(self)")
            
            return nil
        }
        
    }
    
    func firstMatchIn(string: NSString!, atRangeIndex: Int!) -> String {
        
        do {
            let re = try NSRegularExpression(pattern: self, options: .caseInsensitive)
            
            guard let match = re.firstMatch(in: string as String, options: .withoutAnchoringBounds, range: NSMakeRange(0, string.length))
                else {
                    return ""
            }
            
            return string.substring(with: match.rangeAt(atRangeIndex))
            
        }
        catch{
            return ""
        }
    }
}
