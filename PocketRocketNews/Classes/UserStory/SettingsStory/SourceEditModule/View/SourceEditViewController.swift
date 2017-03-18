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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "SourceCell")
        
        cell.textLabel?.text = "URL или Название источника"
        return cell
    }
    
}

extension SourceEditViewController: UITableViewDelegate{
    
}

extension SourceEditViewController: SourceEditControllerDelegate{
    
}
