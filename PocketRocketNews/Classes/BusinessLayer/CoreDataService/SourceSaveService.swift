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
            sourceCD?.link = source.link?.absoluteString

            sourceCD?.feedItems = self.save(source.items, at: context, in: sourceCD!)
            
            context.mr_saveToPersistentStoreAndWait()

        }) { (success, error) in

            print("закончил")

            for item in SourceCD.mr_findAll()! {
                print((item as! SourceCD).name ?? "")
                print((item as! SourceCD).feedItems ?? "")
                
                for feed in ((item as! SourceCD).feedItems)! {
                    print((feed as! FeedItemCD).title)
                }
            }
        }
    }

    private func save(_ feeds: [FeedItem], at context: NSManagedObjectContext, in sourceCD: SourceCD) -> NSMutableSet{

        let feedsCD = NSMutableSet()
        
        for item in feeds {

            let feedCD = FeedItemCD.mr_createEntity(in: context)
            feedCD?.title = item.title
            feedCD?.text = item.text
            feedCD?.image = item.image?.absoluteString
            feedCD?.date = item.pubDate as NSDate?
            feedCD?.source = sourceCD
            
            feedsCD.add(feedCD)
        }

        return feedsCD
    }
}
