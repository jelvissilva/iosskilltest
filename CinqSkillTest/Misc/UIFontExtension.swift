//
//  UIFontExtension.swift
//  PessoaFisica
//
//  Created by Bruno Isola Reginato on 2/19/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

import UIKit

// MARK: - Extension that represents all fonts of this application.
extension UIFont {
    
    //MARK: - Enum
    enum NewJuneFonts: String {
        case NewJuneBook = "NewJuneBook"
        case NewJuneBold = "NewJuneBold"
        case NewJuneSemiBold = "NewJuneSemibold"
        case NewJuneMedium = "NewJuneMedium"
    }
    
    enum FontSize: CGFloat {
        case wee = 10.0
        case tiny = 11.0
        case miniature = 12.0
        case small = 13.0
        case medium = 14.0
        case great = 15.0
        case large = 16.0
        case big = 17.0
        case huge = 18.0
        case high = 22.0
        case enormous = 28.0
        case giant = 32.0
        case colossal = 35.0
        case monster = 40.0
    }
    
    
    static func montSerrat(size:CGFloat) -> UIFont{ return font(name: "Montserrat-Regular", size: size) }
    static func montSerratMedium(size:CGFloat) -> UIFont{ return font(name: "Montserrat-Medium", size: size) }
    static func montSerratSemiBold(size:CGFloat) -> UIFont{ return font(name: "Montserrat-SemiBold", size: size) }
    static func montSerratThin(size:CGFloat) -> UIFont{ return font(name: "Montserrat-Thin", size: size) }
    static func montSerratLight(size:CGFloat) -> UIFont{ return font(name: "Montserrat-Light", size: size) }
    static func montSerratItalic(size:CGFloat) -> UIFont{ return font(name: "Montserrat-Italic", size: size) }
    static func montSerratBold(size:CGFloat) -> UIFont{ return font(name: "Montserrat-Bold", size: size) }
    
    static fileprivate func font(name:String,size:CGFloat) -> UIFont{
        guard let font = UIFont(name: name, size: size) else {
            debugPrint("Error on UIFont Extension - font name \(name) dont exist")
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    //MARK: - App Custom Font
    static func newJuneBook(size: CGFloat) -> UIFont {
        let font = UIFont(name: NewJuneFonts.NewJuneBook.rawValue, size: size)
        
        return font!
    }
    
    static func newJuneMedium(size: CGFloat) -> UIFont {
        let font = UIFont(name: NewJuneFonts.NewJuneMedium.rawValue, size: size)
        
        return font!
    }
    
    static func newJuneBold(size: CGFloat) -> UIFont {
        let font = UIFont(name: NewJuneFonts.NewJuneBold.rawValue, size: size)
        
        return font!
    }
    
    static func newJuneSemiBold(size: CGFloat) -> UIFont {
        let font = UIFont(name: NewJuneFonts.NewJuneSemiBold.rawValue, size: size)
        
        return font!
    }
    
    //MARK: - Revised Fonts
    
    //MARK: - Wee Fonts
    static func weeFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.wee.rawValue)
    }
    
    static func weeNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.wee.rawValue)
    }
    
    static func weeSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.wee.rawValue)
    }
    
    static func weeBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.wee.rawValue)
    }
    
    //MARK: - Tiny Fonts
    static func tinyFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.tiny.rawValue)
    }
    
    static func tinyNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.tiny.rawValue)
    }
    
    static func tinySemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.tiny.rawValue)
    }
    
    static func tinyBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.tiny.rawValue)
    }
    
    //MARK: - Miniature Fonts
    static func miniatureFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.miniature.rawValue)
    }
    
    static func miniatureNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.miniature.rawValue)
    }
    
    static func miniatureSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.miniature.rawValue)
    }
    
    static func miniatureBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.miniature.rawValue)
    }
    
    //MARK: - Small Fonts
    static func smallFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.small.rawValue)
    }
    
    static func smallNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.small.rawValue)
    }
    
    static func smallSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.small.rawValue)
    }
    
    static func smallBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.small.rawValue)
    }
    
    //MARK: - Medium Fonts
    static func mediumFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.medium.rawValue)
    }
    
    static func mediumNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.medium.rawValue)
    }
    
    static func mediumSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.medium.rawValue)
    }
    
    static func mediumBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.medium.rawValue)
    }
    
    //MARK: - Great Fonts
    static func greatFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.great.rawValue)
    }
    
    static func greatNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.great.rawValue)
    }
    
    static func greatSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.great.rawValue)
    }
    
    static func greatBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.great.rawValue)
    }
    
    //MARK: - Large Fonts
    static func largeFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.large.rawValue)
    }
    
    static func largeNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.large.rawValue)
    }
    
    static func largeSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.large.rawValue)
    }
    
    static func largeBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.large.rawValue)
    }
    
    //MARK: - Big Fonts
    static func bigFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.big.rawValue)
    }
    
    static func bigNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.big.rawValue)
    }
    
    static func bigSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.big.rawValue)
    }
    
    static func bigBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.big.rawValue)
    }
    
    //MARK: - Huge Fonts
    static func hugeFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.huge.rawValue)
    }
    
    static func hugeNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.huge.rawValue)
    }
    
    static func hugeSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.huge.rawValue)
    }
    
    static func hugeBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.huge.rawValue)
    }
    
    //MARK: - High Fonts
    static func highFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.high.rawValue)
    }
    
    static func highNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.high.rawValue)
    }
    
    static func highSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.high.rawValue)
    }
    
    static func highBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.high.rawValue)
    }
    
    //MARK: - Enormous Fonts
    static func enormousFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.enormous.rawValue)
    }
    
    static func enormousNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.enormous.rawValue)
    }
    
    static func enormousSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.enormous.rawValue)
    }
    
    static func enormousBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.enormous.rawValue)
    }
    
    //MARK: - Giant Fonts
    static func giantFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.giant.rawValue)
    }
    
    static func giantNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.giant.rawValue)
    }
    
    static func giantSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.giant.rawValue)
    }
    
    static func giantBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.giant.rawValue)
    }
    
    //MARK: - Colossal Fonts
    static func colossalFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.colossal.rawValue)
    }
    
    static func colossalNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.colossal.rawValue)
    }
    
    static func colossalSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.colossal.rawValue)
    }
    
    static func colossalBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.colossal.rawValue)
    }
    
    //MARK: - Monster Fonts
    static func monsterFont() -> UIFont {
        return UIFont.newJuneBook(size: FontSize.monster.rawValue)
    }
    
    static func monsterNormalFont() -> UIFont {
        return UIFont.newJuneMedium(size: FontSize.monster.rawValue)
    }
    
    static func monsterSemiBoldFont() -> UIFont {
        return UIFont.newJuneSemiBold(size: FontSize.monster.rawValue)
    }
    
    static func monsterBoldFont() -> UIFont {
        return UIFont.newJuneBold(size: FontSize.monster.rawValue)
    }
}
