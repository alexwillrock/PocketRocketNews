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

    var emptyView: EmptyView{
        
        let frame = CGRect(x: 0, y: 0, width: 240, height: 240)
        let _emptyview = EmptyView(frame: frame)
        _emptyview.center = self.view.center
        
        return _emptyview;
    }
    
    var activityView: UIActivityIndicatorView {
        
        let _activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        _activityView.center = self.view.center
        return _activityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(emptyView)
        self.view.addSubview(activityView)

    }
}

extension BaseViewController: BaseViewControllerProtocol{

    func didDismissEmptyView() {
        self.emptyView.isHidden = true
    }

    func didShowError(message: String){
        
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let cancell = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(cancell)
        
        self.navigationController?.pushViewController(alert, animated: true)
    }
    
    func didShowEmptyView(){
        self.emptyView.isHidden = false
    }
    
    func didShowActivityView() {
        self.activityView.stopAnimating()
        self.activityView.isHidden = true
    }
    
    func didDismissActivityView() {
        self.activityView.startAnimating()
        self.activityView.isHidden = false
    }
}
