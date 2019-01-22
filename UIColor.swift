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
    convenience init?(string: String) {
        let string = string.replacingOccurrences(of: "#", with: "")

        guard
            let hex = Int(string, radix: 16),
            let format = ColorFormat(bitsCount: string.count * 4) else {
                return nil
        }

        self.init(hex: hex, format: format)
    }

    /// Returns color with given hex integer value and color format
    convenience init(hex: Int, format: ColorFormat = .RRGGBB) {

        let red: Int, green: Int, blue: Int, alpha: Int

        switch format {
        case .RGB:
            red   = ((hex & 0xf00) >> 8) << 4 + ((hex & 0xf00) >> 8)
            green = ((hex & 0x0f0) >> 4) << 4 + ((hex & 0x0f0) >> 4)
            blue  = ((hex & 0x00f) >> 0) << 4 + ((hex & 0x00f) >> 0)
            alpha = 255
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
            alpha = 255
            break;
        }

        self.init(
            red: CGFloat(red)/255.0,
            green: CGFloat(green)/255.0,
            blue: CGFloat(blue)/255.0,
            alpha: CGFloat(alpha)/255.0
        )
    }

    /// Returns integer color representation
    var asInt: Int {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        return (Int)(r * 255) << 16 | (Int)(g * 255) << 8  | (Int)(b * 255)  << 0
    }

    /// Returns hex string color representation
    var asHexString: String {
        return String(format:"#%06x", asInt)
    }

}

/// Colors v1.0
/// https://flatuicolors.com/palette/defo
extension UIColor {
    // green sea
    static let flatTurquoiseColor = UIColor(hex: 0x1ABC9C)
    static let flatGreenSeaColor = UIColor(hex: 0x16A085)
    // green
    static let flatEmeraldColor = UIColor(hex: 0x2ECC71)
    static let flatNephritisColor = UIColor(hex: 0x27AE60)
    // blue
    static let flatPeterRiverColor = UIColor(hex: 0x3498DB)
    static let flatBelizeHoleColor = UIColor(hex: 0x2980B9)
    // purple
    static let flatAmethystColor = UIColor(hex: 0x9B59B6)
    static let flatWisteriaColor = UIColor(hex: 0x8E44AD)
    // dark blue
    static let flatWetAsphaltColor = UIColor(hex: 0x34495E)
    static let flatMidnightBlueColor = UIColor(hex: 0x2C3E50)
    // yellow
    static let flatSunFlowerColor = UIColor(hex: 0xF1C40F)
    static let flatOrangeColor = UIColor(hex: 0xF39C12)
    // orange
    static let flatCarrotColor = UIColor(hex: 0xE67E22)
    static let flatPumkinColor = UIColor(hex: 0xD35400)
    // red
    static let flatAlizarinColor = UIColor(hex: 0xE74C3C)
    static let flatPomegranateColor = UIColor(hex: 0xC0392B)
    // white
    static let flatCloudsColor = UIColor(hex: 0xECF0F1)
    static let flatSilverColor = UIColor(hex: 0xBDC3C7)
    // gray
    static let flatAsbestosColor = UIColor(hex: 0x7F8C8D)
    static let flatConcerteColor = UIColor(hex: 0x95A5A6)
}

/// Dutch Pallete
/// https://flatuicolors.com/palette/nl
extension UIColor {

    // Yellow / Red
    static let fd_Sunflower = UIColor(hex: 0xFFC312)
    static let fd_RadianYellow = UIColor(hex: 0xF79F1F)
    static let fd_PuffinsBull = UIColor(hex: 0xEE5A24)
    static let fd_RedPigment = UIColor(hex: 0xEA2027)

    // Green
    static let fd_Energos = UIColor(hex: 0xC4E538)
    static let fd_AndroidGreen = UIColor(hex: 0xA3CB38)
    static let fd_PixelatedGrass = UIColor(hex: 0x009432)
    static let fd_TurkishAqua = UIColor(hex: 0x006266)

    // Blue
    static let fd_BlueMartina = UIColor(hex: 0x12CBC4)
    static let fd_MediterraneanSea = UIColor(hex: 0x1289A7)
    static let fd_MerchantMarineBlue = UIColor(hex: 0x0652DD)
    static let fd_20000LeaguasUnderTheSea = UIColor(hex: 0x1B1464)

    // Rose / Purpule
    static let fd_LavenderRose = UIColor(hex: 0xFDA7DF)
    static let fd_LavenderTea = UIColor(hex: 0xD980FA)
    static let fd_ForgottenPurple = UIColor(hex: 0x9980FA)
    static let fd_CircumorbitalRing = UIColor(hex: 0x5758BB)

    // Rose / Red
    static let fd_BaraRed = UIColor(hex: 0xED4C67)
    static let fd_VeryBerry = UIColor(hex: 0xB53471)
    static let fd_Hollyhock = UIColor(hex: 0x833471)
    static let fd_MargentaPurple = UIColor(hex: 0x6F1E51)
}
