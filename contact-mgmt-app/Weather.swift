//
//  Weather.swift
//  contact-mgmt-app
//
//  Created by Youbaraj Poudel on 1/28/19.
//  Copyright © 2019 Youbaraj Poudel. All rights reserved.
//

import Foundation
import UIKit
class Weather {
    var cityName: String
    var windSpeed: Int
    
    var temperature: Int
    var backgroundImage:UIImage?
    
    var desc : String
    var tempMax : Int
    
    var tempMin : Int
    var humidity : Int
    
    
    init(cityName: String, windSpeed: Int, temperature: Int,backImg : UIImage, desc: String,tempMax : Int, tempMin : Int, humidity : Int) {
        self.cityName = cityName
        self.windSpeed=windSpeed
        self.temperature=temperature
        self.desc=desc
        self.tempMax=tempMax
        self.tempMin=tempMin
        self.humidity=humidity
        
        
    }
    
    
}
