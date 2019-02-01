//
//  Result.swift
//  contact-mgmt-app
//
//  Created by Youbaraj Poudel on 2/1/19.
//  Copyright © 2019 Youbaraj Poudel. All rights reserved.
//

import Foundation

struct Result: Decodable  {
    let name: Name?
    let location: Location?
    var email: String?
    let phone, cell: String?
    let picture: Picture?
}
