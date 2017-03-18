//
//  SourceEditViewController.swift
//  PocketRocketNews
//
//  Created by Алексей on 18.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit

final class SourceEditViewController: UIViewController {

    //MARK: Public 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var add: UIBarButtonItem!
    @IBOutlet weak var edit: UIBarButtonItem!
    
    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func didTapEdit(_ sender: UIBarButtonItem) {
    }
    
    //MARK: Private
    
    fileprivate let kHeight: CGFloat = 120.0
    
    fileprivate var controller: SourceEditController {
        let _controller = SourceEditController()
        _controller.delegate = self;
        return _controller;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension SourceEditViewController: SourceEditControllerDelegate{
    
}
