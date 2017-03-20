//
//  SourceEditService.swift
//  PocketRocketNews
//
//  Created by Алексей on 20.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import MagicalRecord

final class SourceEditService{
    
    func isExist(link: String) -> Bool{

        if (SourceCD.mr_findFirst(byAttribute: "link", withValue: link) != nil){
            return true
        }
        return false
    }
    
    func add(link: String, complete:@escaping () -> Void, failed:@escaping (Error) -> Void){
        
        MagicalRecord.save({ (context) in
            
            if let sourceCD = SourceCD.mr_createEntity(in: context){
                sourceCD.link = link
                sourceCD.date = NSDate()
            }
            
            context.mr_saveToPersistentStoreAndWait()
            
        }) { (success, error) in
            
            let s = SourceCD.mr_findAll()
            print(s)
            
            if let e = error{
                failed(e)
                return
            }
            
            complete()
        }
    }
}
