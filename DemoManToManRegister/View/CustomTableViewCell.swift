//
//  CustomTableViewCell.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/18/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit
func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: alpha
    )
}


class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var yourView: UIView!
    @IBOutlet weak var labelCity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            labelCity.backgroundColor = UIColorFromRGB(rgbValue: 0xfe6d8c, alpha: 0.66)
        } else {
            labelCity.backgroundColor = UIColor.white
        }
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        self.labelCity.text = ""
        
    }
    
    

}
