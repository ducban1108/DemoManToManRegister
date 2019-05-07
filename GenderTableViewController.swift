//
//  GenderTableViewController.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/19/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class GenderTableViewController: UITableViewController {
    var gender: [String] = ["Male","Female"]
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
        let text = NSMutableAttributedString(string: "What your gender?")
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

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gender.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell

        cell?.labelCity.text = gender[indexPath.row]
        UserDefaults.standard.set(gender[indexPath.row], forKey: "gender")

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(gender[indexPath.row], forKey: "gender")
    }



}
