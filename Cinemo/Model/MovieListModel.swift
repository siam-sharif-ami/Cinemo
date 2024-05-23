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
            MovieListModel(id: 2, title: "Earthtastrophe", genres: ["Crime", "Drama"], rating: 9.2, mpa_rating: "", year: 1972, runtime: 175, medium_cover_image: "https://yts.mx/assets/images/movies/earthtastrophe_2016/medium-cover.jpg"),
            MovieListModel(id: 3, title: "Ask Dr. Ruth", genres: ["Action", "Crime", "Drama"], rating: 9.0, mpa_rating: "", year: 2008, runtime: 152, medium_cover_image: "https://yts.mx/assets/images/movies/ask_dr_ruth_2019/medium-cover.jpg"),
            MovieListModel(id: 4, title: "Storm War", genres: ["Action", "Adventure", "Drama"], rating: 8.9, mpa_rating: "", year: 2003, runtime: 201, medium_cover_image: "https://yts.mx/assets/images/movies/storm_war_2011/medium-cover.jpg"),
            MovieListModel(id: 5, title: "Chris Brown: Welcome To My Life", genres: [
                "Documentary"
            ], rating: 7.5, mpa_rating: "", year: 2000, runtime: 190, medium_cover_image: "https://yts.mx/assets/images/movies/storm_war_2011/medium-cover.jpg"),
            MovieListModel(id: 6, title: "Miami Magma", genres: [
                "Documentary"
            ], rating: 7.5, mpa_rating: "", year: 2000, runtime: 190, medium_cover_image: "https://yts.mx/assets/images/movies/miami_magma_2011/medium-cover.jpg"),
            
        ]
    }
    static func example1 ()-> MovieListModel{
        MovieListModel(id: 1, title: "Golden Kamuy", genres: [
            "Action",
            "Adventure",
            "History",
            "Western"
            ], rating: 9.3, mpa_rating: "", year: 1994, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg")
    }
}

