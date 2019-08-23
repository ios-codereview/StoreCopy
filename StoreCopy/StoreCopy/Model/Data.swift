//
//  Data.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

// 필요 api

/*
 
 listImage : artworkUrl512
 title : trackCensoredName
 seller : sellerName
 genres : genres
 price : formattedPrice
 rating : averageUserRatingForCurrentVersion
 
 artworkUrl512 : list image
 
 
*/

// MARK: - DataModel
struct DataModel: Codable {
    let resultCount: Int
    let results: [ResultData]
}

// MARK: - Result
struct ResultData: Codable {
    let artworkUrl512: String
    let sellerName: String
    let trackName: String
    let genres: [String]
    let formattedPrice: FormattedPrice
    let averageUserRating: Double?
    let contentAdvisoryRating: Rating
    let releaseNotes: String?
    let description: String
    let fileSizeBytes: String
    let version: String
    var resource: String {
        let byte = Int64(fileSizeBytes)
        let convertedSize = ByteCountFormatter.string(fromByteCount: byte!, countStyle: .binary)
        
        return convertedSize
    }
    
    let screenshotUrls: [String]
    let trackViewUrl: String
    
    enum CodingKeys: String, CodingKey {
        case artworkUrl512, sellerName
        case trackName, genres
        case formattedPrice, averageUserRating
        case screenshotUrls, trackViewUrl
        case fileSizeBytes, contentAdvisoryRating, releaseNotes, description, version
    }
}

enum FormattedPrice: String, Codable {
    case the5900 = "￦5,900"
    case 무료 = "무료"
}

enum Rating: String, Codable {
    case the12 = "12+"
    case the17 = "17+"
    case the4 = "4+"
}
