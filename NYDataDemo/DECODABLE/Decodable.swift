//
//  Decodable.swift
//  NYDataDemo
//
//  Created by Husain Nahar on 8/5/19.
//  Copyright © 2019 Husain Nahar. All rights reserved.
//

import Foundation

struct Response: Decodable{
    let status: String
    let copyright: String
    let num_results: Int
    let results: [ResultOfResponse]?
}

struct ResultOfResponse: Decodable {
    lazy var expanded: Bool = true
    let url: String?
    let adx_keywords: String?
    let column: String?
    let section: String?
    let byline: String?
    let type: String?
    let title: String?
    let abstract: String?
    let published_date: String?
    let source: String?
    let id: Int?
    let asset_id: Int?
    let views: Int?
    let media: [Media]?
    
}

struct Media: Decodable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approved_for_syndication: Int?
    let mediaMeta: [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        case mediaMeta = "media-metadata"
        
        case approved_for_syndication
        case copyright
        case caption
        case subtype
        case type
    }
}

struct MediaMetadata: Decodable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}
