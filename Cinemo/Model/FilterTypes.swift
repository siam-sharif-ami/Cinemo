//
//  FilterTypes.swift
//  Cinemo
//
//  Created by BS00484 on 5/6/24.
//

import Foundation

enum Genres: String, CaseIterable {
    case action = "Action"
    case adventure = "Adventure"
    case animation = "Animation"
    case comedy = "Comedy"
    case horror = "Horror"
    case thriller = "Thriller"
    case romance = "Romance"
    case none = ""
}

enum SortBy: String, CaseIterable {
    case likeCount = "like_count"
    case rating = "rating"
    case year = "year"
    case none = ""
}

enum OrderBy: String, CaseIterable {
    case asc = "asc"
    case desc = "desc"
    case none = ""
}



