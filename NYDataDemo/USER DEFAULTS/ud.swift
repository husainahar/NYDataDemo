//
//  ud.swift
//  NYDataDemo
//
//  Created by Husain Nahar on 8/7/19.
//  Copyright © 2019 Husain Nahar. All rights reserved.
//

import Foundation

struct defaults{
    
    static let ud = UserDefaults.standard
    
    
    static var userLang : String? {
        get {
            return ud.value(forKey: const.USER_LANGUAGE) as? String
        }
        set(lang) {
            ud.set(lang, forKey: const.USER_LANGUAGE)
            ud.synchronize()
        }
    }
}
