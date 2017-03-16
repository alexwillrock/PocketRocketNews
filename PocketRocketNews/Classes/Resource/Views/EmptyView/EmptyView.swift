//
//  EmptyView.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit
import Reusable

final class EmptyView: UIView, NibOwnerLoadable {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    
    var delegate: EmptyViewProtocol?
    
    @IBAction func didTapRepeat(_ sender: UIButton) {
        delegate?.didTapRepeat(sender);
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
