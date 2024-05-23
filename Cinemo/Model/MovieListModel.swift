//
//  MovieListModel.swift
//  Cinemo
//
//  Created by BS00484 on 20/5/24.
//

import Foundation

struct MovieListModel: Identifiable, Codable{
    
    let id: Int
    let title: String
    let genres: [String]
    let rating: Double
    let mpa_rating: String
    let year:Int
    let runtime: Int
    let medium_cover_image: String
    
    static func examples() -> [MovieListModel]{
        [
            MovieListModel(id: 1, title: "Golden Kamuy", genres: [
                "Action",
                "Adventure",
                "History",
                "Western"
                ], rating: 9.3, mpa_rating: "", year: 1994, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg"),
            
        ]
    }
    static func example1()-> MovieListModel{
        MovieListModel(id: 1, title: "Golden Kamuy", genres: [
            "Action",
            "Adventure",
            "History",
            "Western"
            ], rating: 9.3, mpa_rating: "", year: 1994, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg")
    }
}

