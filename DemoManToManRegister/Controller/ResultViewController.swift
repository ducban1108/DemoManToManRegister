//
//  ResultViewController.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/20/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultCity: UILabel!
    @IBOutlet weak var resultDistrict: UILabel!
    @IBOutlet weak var resultGender: UILabel!
    @IBOutlet weak var resultAge: UILabel!
    @IBOutlet weak var resultStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let city = UserDefaults.standard.object(forKey: "city") as? String else {return}
        resultCity.text = city
        guard let district = UserDefaults.standard.object(forKey: "district") as? String else {return}
        resultDistrict.text = district
        guard let gender = UserDefaults.standard.object(forKey: "gender") as? String else {return}
        resultGender.text = gender
//        guard let age = UserDefaults.standard.object(forKey: "age") as? String else {return}
//        resultAge.text = age
        guard let status = UserDefaults.standard.object(forKey: "status") as? String else {return}
        resultStatus.text = status
        
    }

    
    

    

}
