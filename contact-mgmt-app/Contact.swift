//
//  Contact.swift
//  contact-mgmt-app
//
//  Created by Youbaraj Poudel on 1/20/19.
//  Copyright © 2019 Youbaraj Poudel. All rights reserved.
//

import Foundation
class Contact {
    var title : String
    var fname : String
    var lname : String
    
    var street : String
    var city : String
    var email : String
    var phone : String
    var cell : String
    var profilePicture : String
    var largePic : String
    
    init(title : String, fname : String, lname : String, street : String, city : String, email : String, phone : String, cell : String, profilePicture : String, largePic : String) {
        self.title=title
        self.fname=fname
        self.lname=lname
        
        self.street=street
        self.city=city
        self.email=email
        self.phone=phone
        self.cell=cell
        self.profilePicture=profilePicture
        self.largePic=largePic

    }
    
    func getContacts() -> Array<Contact> {
        var contacts : Array<Contact> = []
        return contacts
    }
    
}
