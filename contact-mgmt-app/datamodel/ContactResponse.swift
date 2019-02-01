//
//  ContactResponse.swift
//  contact-mgmt-app
//
//  Created by Youbaraj Poudel on 2/1/19.
//  Copyright © 2019 Youbaraj Poudel. All rights reserved.
//

import Foundation
struct ContactResponse: Decodable {
    let results: [Result]?
 }
