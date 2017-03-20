//
//  FeedListViewController.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit
import MagicalRecord
import CoreData

final class FeedListViewController: BaseViewController {

    //MARK: public

    @IBOutlet weak var tableView: UITableView!


    //MARK: private

    fileprivate let kHeight: CGFloat = 120.0

    fileprivate var frc: NSFetchedResultsController<NSFetchRequestResult>!
    
    fileprivate var controller: FeedListController {
        let _controller = FeedListController()
        _controller.delegate = self;
        return _controller;
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "RSS Новости"

        setupTableView()

        frc = FeedItemCD.mr_fetchAllGrouped(by: "source.name", with: nil, sortedBy: "source.date,date", ascending: true, delegate: self)
        
    }
    
    fileprivate func setupTableView(){
        
        tableView.register(cellType: FeedListCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = kHeight
        
    }
    
    @IBAction func tap(_ sender: Any) {
        
        controller.getSources()
        
    }
}

extension FeedListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        if let section = frc.sections{
            return section.count
        }
        
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sectionData = frc.sections?[section]{
            return sectionData.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FeedListCell.self)
    
        configure(cell, at: indexPath)
    
        return cell
    }
    
    func configure(_ cell: FeedListCell, at indexPath: IndexPath){
        
        if let object = frc.object(at: indexPath) as? FeedItemCD {
            cell.name.text = object.title
        }
    }
}

extension FeedListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let currSection = frc.sections?[section] {
            return currSection.name
        }
        
        return nil
        
    }

}

extension FeedListViewController: FeedListControllerDelegate {

}
