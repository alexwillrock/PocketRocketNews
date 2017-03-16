//
//  BaseViewController.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit
import Reusable

class BaseViewController: UIViewController {

    var emptyView: EmptyView! {
        
        let frame = CGRect(x: 0, y: 0, width: 240, height: 240)
        let _emptyview = EmptyView(frame: frame)
        _emptyview.center = self.view.center
        
        return _emptyview;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(emptyView)
        
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
