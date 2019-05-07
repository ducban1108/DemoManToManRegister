//
//  CityTableViewController.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/18/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    var displayPlace: [Place] = DataService.shared.getDataCity(filename: "Cities")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 84
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColorFromRGB(rgbValue: 0xFEEED4, alpha: 1.00)
        let heightForHeaderView : CGFloat = 200
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightForHeaderView))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.paragraphSpacing = 10
        paragraphStype.alignment = NSTextAlignment.center
        let attributed = [NSAttributedStringKey.font: titleLabel.font, NSAttributedStringKey.paragraphStyle: paragraphStype] as [NSAttributedStringKey : Any]
        let text = NSMutableAttributedString(string: "Where are you living?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel
        
        
    }
    
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return displayPlace.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell
//        cell?.yourView.layer.cornerRadius = 10
        cell?.labelCity.text = displayPlace[indexPath.row].name
        
        
        return cell!

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "showDistricts":
            if let destination = segue.destination as? DistrictsViewController {
                if let index = tableView.indexPathForSelectedRow {
                    let selectedCity = displayPlace[index.row] as! City
                    UserDefaults.standard.set(displayPlace[index.row].name, forKey: "city")
                    destination.displayPlace = DataService.shared.getDataDistrict(filename: "Districts").filter{$0.cityCode == selectedCity.cityCode}
                }
            }
            
        default:
            return
        }
        
    }

}

class DistrictsViewController: CityTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = tableView.indexPathForSelectedRow {
            UserDefaults.standard.set(displayPlace[index.row].name, forKey: "district")
        }
    }
}
