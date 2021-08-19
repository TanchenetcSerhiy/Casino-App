//
//  UIColor+Utils.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 18.08.2021.
//

import UIKit

extension UIColor {
    convenience init?(hex: String) {
        guard let formattedHexColor = hex.slice(from: "(", to: ")"), formattedHexColor.count == 6 else {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: formattedHexColor).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: 1)
    }
}
