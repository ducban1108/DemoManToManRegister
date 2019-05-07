//
//  customLabel.swift
//  DemoManToManRegister
//
//  Created by Just Kidding on 4/18/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class customLabel: UILabel {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            if newValue == -1 {
                layer.cornerRadius = frame.width < frame.height ? frame.width * 0.5 : frame.height * 0.5
            } else {
                layer.cornerRadius = newValue
            }
            contentMode = .scaleToFill
            clipsToBounds = true
            layer.masksToBounds = true
        }
    }

}
