//
//  BaseViewController.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

protocol BaseViewControllerProtocol{

    func didShowEmptyView()
    
    func didDismissEmptyView()

    func didShowError(message: String)
    
    func didShowActivityView()
    
    func didDismissActivityView()
}
