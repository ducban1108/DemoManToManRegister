//
//  District.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/18/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import Foundation
class District: NSObject, Place {
    var cityCode: Int
    var districtCode: Int
    var name: String
    
    
    init?(dictionary: JSON) {
        guard let cityCode = dictionary["CityCode"] as? Int else {return nil}
        guard let districtCode = dictionary["DistrictCode"] as? Int else {return nil}
        guard let name = dictionary["Name"] as? String else {return nil}
        self.cityCode = cityCode
        self.districtCode = districtCode
        self.name = name
    }
}
