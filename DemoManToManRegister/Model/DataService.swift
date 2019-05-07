//
//  DataService.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/18/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import Foundation
typealias JSON = Dictionary<AnyHashable, Any> 
class DataService {
    static var shared = DataService()
    var _dataCities: [City]?
    var dataCities: [City] {
        get {
            if _dataCities == nil {
                getDataCity(filename: "Cities")
            }
            return _dataCities ?? []
        }
        set {
            _dataCities = newValue
        }
    }
    
    func getDataCity(filename: String) -> [City] {
        _dataCities = []
        guard let pathCity = Bundle.main.path(forResource: filename, ofType: "plist") else {return []}
        guard let dictCity = NSDictionary.init(contentsOfFile: pathCity) as? JSON else {return []}
        guard let citiesJon = dictCity["Cities"] as? [JSON] else {return []}
        
        for cityDictionary in citiesJon {
            if let city = City(dictionary: cityDictionary) {
                print(city.name, city.cityCode)
                _dataCities?.append(city)
            }
        }
        return _dataCities ?? []
    }
    
    private var _dataDistricts: [District]?
    var dataDistricts: [District] {
        get {
            if _dataDistricts == nil {
                getDataDistrict(filename: "Districts")
            }
            return _dataDistricts ?? []
        }
        set {
            _dataDistricts = newValue
        }
    }
    
    func getDataDistrict(filename: String) -> [District] {
        _dataDistricts = []
        guard let pathDistrict = Bundle.main.path(forResource: filename, ofType: "plist") else {return []}
        guard let dictDistrict = NSDictionary.init(contentsOfFile: pathDistrict) as? JSON else {return []}
        guard let districtsJon = dictDistrict["Districts"] as? [JSON] else {return []}
        
        for districtDictionary in districtsJon {
            if let district = District(dictionary: districtDictionary) {
                print(district.name, district.cityCode)
                _dataDistricts?.append(district)
            }
        }
        return _dataDistricts ?? []
    }
}



