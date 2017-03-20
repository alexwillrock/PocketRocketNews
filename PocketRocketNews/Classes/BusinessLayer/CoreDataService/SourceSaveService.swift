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
                        
            let sourceCD = SourceCD.mr_createEntity(in: context)
            sourceCD?.name = source.name
            
            sourceCD?.link = source.link?.absoluteString ?? ""
            sourceCD?.date = NSDate()
            sourceCD?.feedItems = self.save(source.items, at: context, in: sourceCD!)
            
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

            if let feedCD = FeedItemCD.mr_createEntity(in: context){
                
                feedCD.title = item.title
                feedCD.text = item.text
                feedCD.image = item.image?.absoluteString
                feedCD.date = item.pubDate as NSDate?
                feedCD.source = sourceCD
                
                feedsCD.add(feedCD)
            }
        }

        return feedsCD
    }
}
