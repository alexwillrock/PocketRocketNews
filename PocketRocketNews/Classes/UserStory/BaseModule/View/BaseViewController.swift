//
//  BaseViewController.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension BaseViewController: BaseViewControllerProtocol{

    func didDismissEmptyView() {
        
    }

    func didShowError(message: String){
        
    }
    
    func didShowEmptyView(){
        
    }
}
