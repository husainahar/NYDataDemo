//
//  Constant.swift
//  SikkanApp
//
//  Created by Husain Nahar on 10/23/18.
//  Copyright © 2018 Husain Nahar. All rights reserved.
//

import UIKit

struct const {
    
    // URL
    static let BASE_URL = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json"
    static let API_KEY = "Az1h9pQh8bE4xa3uKZjGzFGvbh1ebo2x"
  
    static let ORANGE_COLOR = #colorLiteral(red: 0.9039301276, green: 0.4681271911, blue: 0.3471183777, alpha: 1)
    //
    static let BLACK_COLOR = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    static let WHITE_COLOR = UIColor.white
    
    static let RED_COLOR = #colorLiteral(red: 0.8271384239, green: 0, blue: 0, alpha: 1)
    
    static let GREEN_COLOR = #colorLiteral(red: 0, green: 0.699467957, blue: 0.06375851482, alpha: 1)
    
    static let GOLDEN_COLOR = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    
    static let BLUR_WHITE = UIColor(white: 1.0, alpha: 0.8)
    
    static let BROWN_COLOR = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
    
    static let firstSize: CGFloat = 15
    static let lastSize: CGFloat = 18
    
    static var curentLang: Int = 0
    static let USER_LANGUAGE = "USER_LANGUAGE"
    
    static func attributedTextBoldBigOrange(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.ORANGE_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: lastSize)])
    }
    
    static func attributedTextBoldSmalOrange(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.ORANGE_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: firstSize)])
    }
    
    static func attributedTextNormalBigOrange(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.ORANGE_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: lastSize)])
    }
    
    static func attributedTextNormalSmalOrange(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.ORANGE_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: firstSize)])
    }
    
    
    static func attributedTextBoldBigBlack(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.BLACK_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: lastSize)])
    }
    
    static func attributedTextBoldSmalBlack(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.BLACK_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: firstSize)])
    }
    
    static func attributedTextNormalBigBlack(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.BLACK_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: lastSize)])
    }
    
    static func attributedTextNormalSmalBlack(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.BLACK_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: firstSize)])
    }
    
    static func attributedTextBoldBigWhite(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.WHITE_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: lastSize)])
    }
    
    static func attributedTextBoldSmalWhite(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.WHITE_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: firstSize)])
    }
    
    static func attributedTextNormalBigWhite(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.WHITE_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: lastSize)])
    }
    
    static func attributedTextNormalSmalWhite(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.WHITE_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: firstSize)])
    }
    
    static func attributedTextBoldBigBrown(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.BROWN_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: lastSize)])
    }
    
    static func attributedTextBoldSmalBrown(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.BROWN_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: firstSize)])
    }
    
    static func attributedTextNormalBigBrown(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.BROWN_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: lastSize)])
    }
    
    static func attributedTextNormalSmalBrown(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.BROWN_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: firstSize)])
    }
    
    static func attributedTextBoldBigGreen(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.GREEN_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: lastSize)])
    }
    
    static func attributedTextBoldSmalGreen(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.GREEN_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: firstSize)])
    }
    
    static func attributedTextNormalBigGreen(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.GREEN_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: lastSize)])
    }
    
    static func attributedTextNormalSmalGreen(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.GREEN_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: firstSize)])
    }
    
    static func attributedTextBoldBigGolden(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.GOLDEN_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: lastSize)])
    }
    
    static func attributedTextBoldSmalGolden(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.GOLDEN_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: firstSize)])
    }
    
    static func attributedTextNormalBigGolden(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.GOLDEN_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: lastSize)])
    }
    
    static func attributedTextNormalSmalGolden(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.GOLDEN_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: firstSize)])
    }
    
    static func attributedTextBoldBigRed(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.RED_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: lastSize)])
    }
    
    static func attributedTextBoldSmalRed(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.RED_COLOR, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: firstSize)])
    }
    
    static func attributedTextNormalBigRed(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.RED_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: lastSize)])
    }
    
    static func attributedTextNormalSmalRed(with str: String) -> NSAttributedString{
        
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: const.RED_COLOR, NSAttributedString.Key.font: UIFont.systemFont(ofSize: firstSize)])
    }
}
