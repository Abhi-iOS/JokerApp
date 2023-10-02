//
//  AppColors.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import UIKit

enum AppColors: String {
    case appBg = "app_background"
    case cellBg = "cell_background"
    case textGrey = "text_grey"
    
    var color : UIColor {
        return UIColor(named: rawValue)!
    }
}
