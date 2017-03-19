//
//  Helpers.swift
//  PocketRocketNews
//
//  Created by Алексей on 19.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation


extension String {

    func firstImage() -> URL? {

        let pattern = "<img.*?src=\"([^\"]*)\""

        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            guard let match = regex.firstMatch(in: self, options: .withoutAnchoringBounds, range: NSMakeRange(0, self.characters.count)) else {
                return nil
            }

            let imageStr = (self as NSString).substring(with: match.rangeAt(1))

            return URL(string: imageStr)

        } catch {

            print("не удалось преобразовать строку \(self)")

            return nil
        }
    }
    
    func rssDate() -> Date{

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        if let date = dateFormatter.date(from: self){
            return date
        }
        
        return Date()
    }
}
