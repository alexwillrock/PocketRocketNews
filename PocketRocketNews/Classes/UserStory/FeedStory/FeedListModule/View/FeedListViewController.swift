//
//  FeedListViewController.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit

final class FeedListViewController: BaseViewController {

    fileprivate var controller: FeedListController {
        var _controller = FeedListController()
        _controller.delegate = self;
        return _controller;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension FeedListViewController: FeedListControllerDelegate{
    
}
