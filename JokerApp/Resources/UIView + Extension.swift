//
//  UIView + Extension.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

