//
//  AgeViewController.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/18/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var yearsBirth: [Int] = [Int](1900...2019)
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var agePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePickerView.delegate = self
        agePickerView.dataSource = self
        agePickerView.selectRow(50, inComponent: 0, animated: true)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(pushToNextView))
//        tap.delegate = self as? UIGestureRecognizerDelegate
//        view.addGestureRecognizer(tap)
//        tap.numberOfTapsRequired = 2
//        tap.numberOfTouchesRequired = 1
        
    }
    
    @objc func pushToNextView() {
        pushVc()
    }
    private func pushVc() {
        let nextVc = storyboard?.instantiateViewController(withIdentifier: "Status") as! StatusTableViewController
        navigationController?.pushViewController(nextVc, animated: true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearsBirth.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(yearsBirth[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.view.endEditing(false) 
        UserDefaults.standard.set(yearsBirth[row], forKey: "age")
        pushVc()
        
        
    }
    
    @IBAction func buttonDone(_ sender: UIButton) {
        
    }
    

}
