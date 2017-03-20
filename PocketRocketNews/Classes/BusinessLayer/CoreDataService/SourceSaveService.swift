//
//  SourceSaveService.swift
//  PocketRocketNews
//
//  Created by Алексей on 19.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import MagicalRecord

final class SourceSaveService {

    func save(_ source: Source) {

        MagicalRecord.save({ (context) in
            
            if let originalSource = SourceCD.mr_findFirst(byAttribute: "link", withValue: source.link?.absoluteString ?? "", in: context){
                
                originalSource.name = source.name
                originalSource.date = NSDate()
                originalSource.feedItems = self.save(source.items, at: context, in: originalSource)
            }else{
                
                let sourceCD = SourceCD.mr_createEntity(in: context)
                sourceCD?.name = source.name
                
                sourceCD?.link = source.link?.absoluteString ?? ""
                sourceCD?.date = NSDate()
                sourceCD?.feedItems = self.save(source.items, at: context, in: sourceCD!)
            }
            
            context.mr_saveToPersistentStoreAndWait()

        }) { (success, error) in

            print("закончил")
            
            let sources = SourceCD.mr_findAll()
            
            for source in sources!{
                
                let s = source as! SourceCD
                print(s.name ?? "пусто")
                
                for item in s.feedItems! {
                    
                    print( (item as! FeedItemCD).title ?? "пусто")
                    
                }
            }
        }
    }

    private func save(_ feeds: [FeedItem], at context: NSManagedObjectContext, in sourceCD: SourceCD) -> NSMutableSet{

        let feedsCD = NSMutableSet()
        
        for item in feeds {
            
            if let originalFeedCD = FeedItemCD.mr_findFirst(byAttribute: "date", withValue: item.pubDate as NSDate, in: context){
                
                originalFeedCD.title = item.title
                originalFeedCD.text = item.text
                originalFeedCD.image = item.image?.absoluteString
                originalFeedCD.date = item.pubDate as NSDate?
                originalFeedCD.source = sourceCD
                
                feedsCD.add(originalFeedCD)
                
            }
            else{
                
                if let feedCD = FeedItemCD.mr_createEntity(in: context){
                    
                    feedCD.title = item.title
                    feedCD.text = item.text
                    feedCD.image = item.image?.absoluteString
                    feedCD.date = item.pubDate as NSDate?
                    feedCD.source = sourceCD
                    
                    feedsCD.add(feedCD)
                }

            }
            
        }

        return feedsCD
    }
}
