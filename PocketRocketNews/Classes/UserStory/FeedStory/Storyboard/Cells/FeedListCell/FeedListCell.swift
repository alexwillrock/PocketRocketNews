//
//  FeedListCell.swift
//  PocketRocketNews
//
//  Created by Алексей on 18.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit
import Reusable

class FeedListCell: UITableViewCell, NibReusable {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
        // Initialization code
    }
    

}
