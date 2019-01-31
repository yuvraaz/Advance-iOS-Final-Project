//
//  ContactCellViewController.swift
//  contact-mgmt-app
//
//  Created by Youbaraj Poudel on 1/28/19.
//  Copyright © 2019 Youbaraj Poudel. All rights reserved.
//

import Foundation
import UIKit
class ContactCellViewController: UITableViewCell{
    @IBOutlet weak var contactImage: UIImageView!
     @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var labelEmailAddress: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contactImage.layer.cornerRadius = contactImage.frame.size.width/2
        contactImage.clipsToBounds = true
   
     }
    
}
