//
//  SourceEditViewController.swift
//  PocketRocketNews
//
//  Created by Алексей on 18.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit
import MagicalRecord

final class SourceEditViewController: BaseViewController {

    //MARK: Public 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var add: UIBarButtonItem!
    @IBOutlet weak var edit: UIBarButtonItem!
    
    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {

        let alert = AlertView().show(title: "Rss источник", message: "Адрес прямой ссылки", ok: "Добавить", placeholder: "http://www.aweber.com/blog/feed/", { (result) in
            self.controller.add(link: result)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapEdit(_ sender: UIBarButtonItem) {
        
    }
    
    //MARK: Private
    
    fileprivate var frc: NSFetchedResultsController<NSFetchRequestResult>!
    
    fileprivate let kHeight: CGFloat = 44.0
    
    fileprivate var controller: SourceEditController {
        let _controller = SourceEditController()
        _controller.delegate = self;
        return _controller;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        self.title = "RSS Новости"

        frc = SourceCD.mr_fetchAllSorted(by: "date", ascending: true, with: nil, groupBy: nil, delegate: self)
        
        let s = SourceCD.mr_findAll()
        print(s)
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = kHeight        
    }
}

extension SourceEditViewController: UITableViewDataSource{
    
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
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "SourceCell")
        
        configure(cell, at: indexPath)
        
        return cell
    }
    
    func configure(_ cell: UITableViewCell, at indexPath: IndexPath){
        
        if let object = frc.object(at: indexPath) as? SourceCD {
            print(object.name)
            print(object.link)
            print(cell.textLabel?.text)
            cell.textLabel?.text = object.link
        }
    }
}

extension SourceEditViewController: UITableViewDelegate{
    
}

extension SourceEditViewController: SourceEditControllerDelegate{
    
    func showError(message: String) {
        self.didShowError(message: message)
    }
    
}
