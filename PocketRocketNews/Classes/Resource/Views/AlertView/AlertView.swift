//
//  AlertView.swift
//  PocketRocketNews
//
//  Created by Алексей on 20.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import Foundation
import UIKit.UIAlertController

final class AlertView{
    
    func show(title: String, message: String, ok: String, placeholder: String,
              _ complete:@escaping (_ text: String) -> Void) -> UIAlertController{
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let addAction = UIAlertAction(title: ok, style: .default) { action in
            
            if let textField = alert.textFields?.first {
                complete(textField.text ?? "")
            }
        }
        
        let cancellAction = UIAlertAction(title: "Отмена", style: .cancel) { action in
            alert.dismiss(animated: true)
        }
        
        alert.addTextField { textField in
            textField.placeholder = placeholder
        }
        
        alert.addAction(addAction)
        alert.addAction(cancellAction)
        
        return alert
    }
    
}
