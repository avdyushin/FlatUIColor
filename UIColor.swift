//
//  UIColor.swift
//  Flat UI Colors
//
//  Created by Grigory Avdyushin on 22.01.15.
//  Copyright (c) 2015-2017 Grigory Avdyushin. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Color formats
    enum ColorFormat: Int {
        
        case RGB = 12
        case RGBA = 16
        case RRGGBB = 24
        
        init?(bitsCount: Int) {
            self.init(rawValue: bitsCount)
        }
        
    }
    
    /// Returns color with given hex string
    convenience init(string: String) {
        
        let string = string.replacingOccurrences(of: "#", with: "")
        
        if
            let hex = Int(string, radix: 16),
            let format = ColorFormat(bitsCount: string.characters.count * 4) {
            
            self.init(hex: hex, format: format)
            
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        }
        
    }
    
    /// Returns color with given hex integer value and color format
    convenience init(hex: Int, format: ColorFormat = .RRGGBB) {
        
        var red = 0, green = 0, blue = 0, alpha = 255
        
        switch format {
        case .RGB:
            red   = ((hex & 0xf00) >> 8) << 4 + ((hex & 0xf00) >> 8)
            green = ((hex & 0x0f0) >> 4) << 4 + ((hex & 0x0f0) >> 4)
            blue  = ((hex & 0x00f) >> 0) << 4 + ((hex & 0x00f) >> 0)
            break;
        case .RGBA:
            red   = ((hex & 0xf000) >> 12) << 4 + ((hex & 0xf000) >> 12)
            green = ((hex & 0x0f00) >>  8) << 4 + ((hex & 0x0f00) >>  8)
            blue  = ((hex & 0x00f0) >>  4) << 4 + ((hex & 0x00f0) >>  4)
            alpha = ((hex & 0x000f) >>  0) << 4 + ((hex & 0x000f) >>  4)
            break;
        case .RRGGBB:
            red   = ((hex & 0xff0000) >> 16)
            green = ((hex & 0x00ff00) >>  8)
            blue  = ((hex & 0x0000ff) >>  0)
            break;
        }
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
        
    }
    
    /// Returns integer color representation
    var asInt: Int {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let hex: Int = (Int)(r * 0xff) << 16 |
                       (Int)(g * 0xff) << 8  |
                       (Int)(b * 255)  << 0
        return hex
    }
    
    /// Returns hex string color representation
    var asHexString: String {
        return String(format:"#%06x", asInt)
    }
    
    // green sea
    static let flatTurquoiseColor = UIColor(hex: 0x1abc9c)
    static let flatGreenSeaColor = UIColor(hex: 0x16a085)
    // green
    static let flatEmeraldColor = UIColor(hex: 0x2ecc71)
    static let flatNephritisColor = UIColor(hex: 0x27ae60)
    // blue
    static let flatPeterRiverColor = UIColor(hex: 0x3498db)
    static let flatBelizeHoleColor = UIColor(hex: 0x2980b9)
    // purple
    static let flatAmethystColor = UIColor(hex: 0x9b59b6)
    static let flatWisteriaColor = UIColor(hex: 0x8e44ad)
    // dark blue
    static let flatWetAsphaltColor = UIColor(hex: 0x34495e)
    static let flatMidnightBlueColor = UIColor(hex: 0x2c3e50)
    // yellow
    static let flatSunFlowerColor = UIColor(hex: 0xf1c40f)
    static let flatOrangeColor = UIColor(hex: 0xf39c12)
    // orange
    static let flatCarrotColor = UIColor(hex: 0xe67e22)
    static let flatPumkinColor = UIColor(hex: 0xd35400)
    // red
    static let flatAlizarinColor = UIColor(hex: 0xe74c3c)
    static let flatPomegranateColor = UIColor(hex: 0xc0392b)
    // white
    static let flatCloudsColor = UIColor(hex: 0xecf0f1)
    static let flatSilverColor = UIColor(hex: 0xbdc3c7)
    // gray
    static let flatAsbestosColor = UIColor(hex: 0x7f8c8d)
    static let flatConcerteColor = UIColor(hex: 0x95a5a6)
    
}
