//
//  NSAttributedStringExtension.swift
//  CinqSkillTest
//
//  Created by Flavio Telles Paschoal Santos on 02/09/19.
//  Copyright © 2019 POCS. All rights reserved.
//

import Foundation
import UIKit


extension NSAttributedString {

    
    //MARK: - Menu item text (BPFMenuTitleLabel)
    static func menuItem(_ text: String) -> NSAttributedString {
        
    
        let anotherWay = [NSAttributedString.Key.font:UIFont.largeFont(), NSAttributedString.Key.foregroundColor:UIColor.greyFontColor]
        
       // let fontKey = convertFromNSAttributedStringKey(NSAttributedString.Key.font)
//
//        let colorKey = convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor)
//
//        let fontDefault = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.largeFont(), convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.greyFontColor()]
       
        
//        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: text, attributes: convertToOptionalNSAttributedStringKeyDictionary(anotherWay))
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: text, attributes: anotherWay)

        
        return attributedString
    }
    
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
        guard let input = input else { return nil }
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
    }
    
  
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
        return input.rawValue
    }
}
