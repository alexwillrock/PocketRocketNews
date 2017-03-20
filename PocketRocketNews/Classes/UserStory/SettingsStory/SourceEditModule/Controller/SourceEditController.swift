//
//  SourceEditController.swift
//  PocketRocketNews
//
//  Created by Алексей on 18.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit

final class SourceEditController {

    var delegate: SourceEditControllerDelegate?
    
    func add(link: String){
        
        if !String.validate(urlString: link){
            delegate?.showError(message: "Вы ввели неверный URL адресс RSS ленты")
            return
        }
        
        if sourceEditService.isExist(link: link){
            delegate?.showError(message: "Этот RSS источник уже существует")
            return
        }
        
        sourceEditService.add(link: link, complete: { 
            self.sourceRequest.getFeedList(atPath: link, { (sources) in
                print(sources)
                
                if let sources = sources{
                    self.sourceSaveService.save(sources)
                }
                
                
            }, failedBlock: { (error) in
                self.delegate?.showError(message: "Ошибка загрузки RSS лент")
            })

        }) { (error) in
            self.delegate?.showError(message: "Ошибка сохранения RSS лент")

        }
    }
    
    fileprivate let sourceEditService = SourceEditService()
    fileprivate let sourceRequest = SourceRequest()
    fileprivate let sourceSaveService = SourceSaveService()
    
}

//        let paths = ["http://www.aweber.com/blog/feed/", "http://www.internetnews.com/icom_includes/feeds/inews/xml_front-10.xml"]
