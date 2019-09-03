//
//  UIColor+Extensions.swift
//  KeyboardPrime
//
//  Created by Sore on 03/08/2018.
//  Copyright © 2018 Bradesco. All rights reserved.
//

import UIKit

fileprivate let kBackgroundGrayColor:String = "C9CED5"
fileprivate let kBackgroundLightRedColor:String = "FFE8E9"
fileprivate let kButtonGrayColor:String = "AAB0BC"
fileprivate let kKeyboardHighlightVariationSelected:String = "1475E9"
fileprivate let kCustomBluer:String = "4C9FD1"
fileprivate let kGreyFontColor:String = "64646B"

extension UIColor{
    
    class func hexColor (_ hexStr : String, alpha : CGFloat) -> UIColor {
        
        let hexStr  = hexStr.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            #if DEBUG
            debugPrint("invalid hex string", terminator: "")
            #endif
            return UIColor.white
        }
    }
    
    class var keyboardBackgroundColor:UIColor{
        return self.hexColor(kBackgroundGrayColor, alpha: 1)
    }
    
    class var keyboardHighlightVariationSelected:UIColor{
        return self.hexColor(kKeyboardHighlightVariationSelected, alpha: 1)
    }
    
    class var buttonGreyColor:UIColor{
        return self.hexColor(kButtonGrayColor, alpha: 1)
    }
    
    class var customBlue:UIColor{
        return self.hexColor(kCustomBluer, alpha: 1)
    }
    
    static var greyFontColor:UIColor{
        return self.hexColor(kGreyFontColor, alpha: 1)
    }
    
}
