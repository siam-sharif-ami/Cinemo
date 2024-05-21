//
//  Movie.swift
//  Cinemo
//
//  Created by BS00484 on 20/5/24.
//

import Foundation

struct Movie: Codable {
    let id : Int
    let title: String
    let year: Int
    let rating: Double
    let runtime: Int
    let genres: [String]
    let summary: String
    let large_cover_image: String
    let background_image: String
    
}
