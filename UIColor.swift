//
//  UIColor.swift
//  Flat UI Colors
//
//  Created by Grigory Avdyushin on 22.01.15.
//  Copyright (c) 2015-2019 Grigory Avdyushin. All rights reserved.
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

        guard
            let hex = Int(string, radix: 16),
            let format = ColorFormat(bitsCount: string.count * 4) else {
                self.init(white: 0, alpha: 0)
                return
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
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(alpha) / 255.0
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

    /// Returns color with adjusted saturation or/and brightness
    func withAdjusted(saturation: CGFloat = 0.0, brightness: CGFloat = 0.0) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0

        guard getHue(&h, saturation: &s, brightness: &b, alpha: &a) else {
            return self
        }

        return UIColor(
            hue: h,
            saturation: min(max(s + saturation, 0.0), 1.0),
            brightness: min(max(b + brightness, 0.0), 1.0),
            alpha: a
        )
    }

    /// Returns lighter color by 25%
    var lighterColor: UIColor {
        return self.withAdjusted(saturation: -0.25)
    }

    /// Return darker color by 25%
    var darkerColor: UIColor {
        return self.withAdjusted(brightness: -0.25)
    }
}

/// Flat UI Palette v1
/// https://flatuicolors.com/palette/defo
extension UIColor {

    // Green / Sea
    static let flatTurquoise = UIColor(hex: 0x1ABC9C)
    static let flatGreenSea = UIColor(hex: 0x16A085)
    // Green
    static let flatEmerald = UIColor(hex: 0x2ECC71)
    static let flatNephritis = UIColor(hex: 0x27AE60)
    // Blue
    static let flatPeterRiver = UIColor(hex: 0x3498DB)
    static let flatBelizeHole = UIColor(hex: 0x2980B9)
    // Purple
    static let flatAmethyst = UIColor(hex: 0x9B59B6)
    static let flatWisteria = UIColor(hex: 0x8E44AD)
    // Dark blue
    static let flatWetAsphalt = UIColor(hex: 0x34495E)
    static let flatMidnightBlue = UIColor(hex: 0x2C3E50)
    // Yellow
    static let flatSunFlower = UIColor(hex: 0xF1C40F)
    static let flatOrange = UIColor(hex: 0xF39C12)
    // Orange
    static let flatCarrot = UIColor(hex: 0xE67E22)
    static let flatPumkin = UIColor(hex: 0xD35400)
    // Red
    static let flatAlizarin = UIColor(hex: 0xE74C3C)
    static let flatPomegranate = UIColor(hex: 0xC0392B)
    // White
    static let flatClouds = UIColor(hex: 0xECF0F1)
    static let flatSilver = UIColor(hex: 0xBDC3C7)
    // Gray
    static let flatAsbestos = UIColor(hex: 0x7F8C8D)
    static let flatConcerte = UIColor(hex: 0x95A5A6)
}

/// Dutch Palette
/// https://flatuicolors.com/palette/nl
extension UIColor {

    // Yellow / Red
    static let flatSunflower = UIColor(hex: 0xFFC312)
    static let flatRadianYellow = UIColor(hex: 0xF79F1F)
    static let flatPuffinsBull = UIColor(hex: 0xEE5A24)
    static let flatRedPigment = UIColor(hex: 0xEA2027)
    // Green
    static let flatEnergos = UIColor(hex: 0xC4E538)
    static let flatAndroidGreen = UIColor(hex: 0xA3CB38)
    static let flatPixelatedGrass = UIColor(hex: 0x009432)
    static let flatTurkishAqua = UIColor(hex: 0x006266)
    // Blue
    static let flatBlueMartina = UIColor(hex: 0x12CBC4)
    static let flatMediterraneanSea = UIColor(hex: 0x1289A7)
    static let flatMerchantMarineBlue = UIColor(hex: 0x0652DD)
    static let flat20000LeaguesUnderTheSea = UIColor(hex: 0x1B1464)
    // Rose / Purpule
    static let flatLavenderRose = UIColor(hex: 0xFDA7DF)
    static let flatLavenderTea = UIColor(hex: 0xD980FA)
    static let flatForgottenPurple = UIColor(hex: 0x9980FA)
    static let flatCircumorbitalRing = UIColor(hex: 0x5758BB)
    // Rose / Red
    static let flatBaraRed = UIColor(hex: 0xED4C67)
    static let flatVeryBerry = UIColor(hex: 0xB53471)
    static let flatHollyhock = UIColor(hex: 0x833471)
    static let flatMargentaPurple = UIColor(hex: 0x6F1E51)
}
