//
//  Encodable.swift
//  NYDataDemo
//
//  Created by Husain Nahar on 8/5/19.
//  Copyright © 2019 Husain Nahar. All rights reserved.
//

import Foundation

struct Encoder: Encodable{
    let apiKey: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api-key"
    }
}
