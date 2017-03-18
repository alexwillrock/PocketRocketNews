//
//  FeedListViewController.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit

final class FeedListViewController: BaseViewController {

    //MARK: public
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: private
    
    fileprivate let kHeight: CGFloat = 120.0
    
    fileprivate var controller: FeedListController {
        let _controller = FeedListController()
        _controller.delegate = self;
        return _controller;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(cellType: FeedListCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = kHeight
        
        self.title = "RSS Новости"
        
        // Do any additional setup after loading the view.
    }
}

extension FeedListViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FeedListCell.self)
     
        return cell
    }
}

extension FeedListViewController: UITableViewDelegate{
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return kHeight
//    }
    
}

extension FeedListViewController: FeedListControllerDelegate{
    
}
