//
//  GenderViewController.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/18/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    var gender : [String] = ["Male","Female"]
    
    @IBOutlet weak var genderPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderPickerView.selectRow(0, inComponent: 0, animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(gender[row], forKey: "gender")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }
    

    

}
