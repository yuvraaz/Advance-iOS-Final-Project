//
//  Picture.swift
//  contact-mgmt-app
//
//  Created by Youbaraj Poudel on 2/1/19.
//  Copyright © 2019 Youbaraj Poudel. All rights reserved.
//

import Foundation
import UIKit

struct Picture: Decodable  {
    let large, medium, thumbnail: String?
}
