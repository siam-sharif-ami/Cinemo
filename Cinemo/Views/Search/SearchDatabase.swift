//
//  SearchDatabase.swift
//  Cinemo
//
//  Created by BS00484 on 30/5/24.
//

import Foundation

struct SearchDatabase: Codable {
    
    let status: String
    let status_message: String
    let data: SearchData
}

struct SearchData : Codable {
    var movies: [SearchListModel]
}

struct SearchListModel: Identifiable, Codable{
    
    let id: Int
    let title: String
    let genres: [String]
    let rating: Double
    let mpa_rating: String
    let year:Int
    let runtime: Int
    let medium_cover_image: String
    
    static func examples() -> [SearchListModel]{
        [
            SearchListModel(id: 1, title: "Golden Kamuy", genres: [
                "Action",
                "Adventure",
                "History",
                "Western"
                ], rating: 9.3, mpa_rating: "", year: 1994, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg"),
            SearchListModel(id: 2, title: "Golden Kamuy", genres: [
                "Action",
                "Adventure",
                "History",
                "Western"
                ], rating: 9.3, mpa_rating: "", year: 1994, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg"),
            SearchListModel(id: 3, title: "Golden Kamuy", genres: [
                "Action",
                "Adventure",
                "History",
                "Western"
                ], rating: 9.3, mpa_rating: "", year: 1994, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg"),
            SearchListModel(id: 4, title: "Golden Kamuy", genres: [
                "Action",
                "Adventure",
                "History",
                "Western"
                ], rating: 9.3, mpa_rating: "", year: 1994, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg"),
            
        ]
    }
    static func example1()-> SearchListModel{
        SearchListModel(id: 1, title: "Golden Kamuy", genres: [
            "Action",
            "Adventure",
            "History",
            "Western"
            ], rating: 9.3, mpa_rating: "", year: 1994, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg")
    }
}

