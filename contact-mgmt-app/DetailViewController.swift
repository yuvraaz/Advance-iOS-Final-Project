//
//  DetailViewController.swift
//  contact-mgmt-app
//
//  Created by Youbaraj Poudel on 1/20/19.
//  Copyright © 2019 Youbaraj Poudel. All rights reserved.
//

import Foundation
import UIKit
class DetailViewController: UIViewController {
    
 
    //UI Components
    @IBOutlet weak var imageUserProfile: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelFirstName: UILabel!
    
    @IBOutlet weak var labelLastName: UILabel!
    @IBOutlet weak var labelStreet: UILabel!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelCell: UILabel!
    //Data
    var contact : Contact?
    var imageUrl : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upadateUI()
    }
    
    
    func upadateUI() {
        imageUrl=contact?.largePic
        
        let url = URL(string:imageUrl)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.imageUserProfile.image = UIImage(data: data!)
            }
        }
        
        self.labelTitle?.text=contact?.title
        self.labelFirstName?.text=contact?.fname
        self.labelLastName?.text=contact?.lname
        self.labelStreet?.text=contact?.street
        self.labelCity?.text=contact?.city
        self.labelEmail?.text=contact?.email
        self.labelPhone?.text=contact?.phone
        self.labelCell?.text=contact?.phone
        
     }
}