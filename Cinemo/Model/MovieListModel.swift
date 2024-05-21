//
//  MovieListModel.swift
//  Cinemo
//
//  Created by BS00484 on 20/5/24.
//

import Foundation

struct MovieListModel: Identifiable{
    
    let id: Int
    let title: String
    let genre: [String]
    let rating: Double
    let ageRating: Int
    let year:Int
    let duration: Int
    let coverImage: String
    
    static func examples() -> [MovieListModel]{
        [
            MovieListModel(id: 1, title: "Golden Kamuy", genre: [
                "Action",
                "Adventure",
                "History",
                "Western"
                ], rating: 9.3, ageRating: 13, year: 1994, duration: 142, coverImage: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg"),
            MovieListModel(id: 2, title: "Earthtastrophe", genre: ["Crime", "Drama"], rating: 9.2, ageRating: 18, year: 1972, duration: 175, coverImage: "https://yts.mx/assets/images/movies/earthtastrophe_2016/medium-cover.jpg"),
            MovieListModel(id: 3, title: "Ask Dr. Ruth", genre: ["Action", "Crime", "Drama"], rating: 9.0, ageRating: 13, year: 2008, duration: 152, coverImage: "https://yts.mx/assets/images/movies/ask_dr_ruth_2019/medium-cover.jpg"),
            MovieListModel(id: 4, title: "Storm War", genre: ["Action", "Adventure", "Drama"], rating: 8.9, ageRating: 13, year: 2003, duration: 201, coverImage: "https://yts.mx/assets/images/movies/storm_war_2011/medium-cover.jpg"),
            MovieListModel(id: 5, title: "Chris Brown: Welcome To My Life", genre: [
                "Documentary"
            ], rating: 7.5, ageRating: 19, year: 2000, duration: 190, coverImage: "https://yts.mx/assets/images/movies/storm_war_2011/medium-cover.jpg"),
            MovieListModel(id: 6, title: "Miami Magma", genre: [
                "Documentary"
            ], rating: 7.5, ageRating: 19, year: 2000, duration: 190, coverImage: "https://yts.mx/assets/images/movies/miami_magma_2011/medium-cover.jpg"),
            
        ]
    }
    static func example1 ()-> MovieListModel{
        MovieListModel(id: 1, title: "Golden Kamuy", genre: [
            "Action",
            "Adventure",
            "History",
            "Western"
            ], rating: 9.3, ageRating: 13, year: 1994, duration: 142, coverImage: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg")
    }
}

