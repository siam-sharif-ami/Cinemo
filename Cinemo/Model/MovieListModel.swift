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
    let cast: [CastData]?
    let description_full: String
    
    static func examples() -> [MovieListModel] {
            [
                MovieListModel(id: 1, title: "Golden Kamuy", genres: [
                    "Action",
                    "Adventure",
                    "History",
                    "Western"
                ], rating: 9.3, mpa_rating: "R", year: 2024, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg", cast: [
                    CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                    CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
                ], description_full: "In the early 20th century, Russo-Japanese War veteran Saichi Sugimoto searches for a vast fortune of gold hidden by the Ainu people."),
                
                MovieListModel(id: 2, title: "Golden Kamuy 2", genres: [
                    "Action",
                    "Adventure",
                    "History",
                    "Western"
                ], rating: 8.7, mpa_rating: "PG-13", year: 2025, runtime: 145, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2025/medium-cover.jpg", cast: [
                    CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                    CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
                ], description_full: "The journey continues as Saichi Sugimoto faces new challenges and enemies in his quest for the hidden gold."),
                
                MovieListModel(id: 3, title: "Golden Kamuy 3", genres: [
                    "Action",
                    "Adventure",
                    "History",
                    "Western"
                ], rating: 9.1, mpa_rating: "R", year: 2026, runtime: 150, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2026/medium-cover.jpg", cast: [
                    CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                    CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
                ], description_full: "Saichi Sugimoto and his allies venture deeper into the wilderness, uncovering secrets and facing greater dangers."),
                
                MovieListModel(id: 4, title: "Golden Kamuy 4", genres: [
                    "Action",
                    "Adventure",
                    "History",
                    "Western"
                ], rating: 9.5, mpa_rating: "R", year: 2027, runtime: 155, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2027/medium-cover.jpg", cast: [
                    CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                    CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
                ], description_full: "The epic conclusion of Saichi Sugimoto's quest for the Ainu gold, with intense battles and dramatic revelations."),
                MovieListModel(id: 5, title: "Golden Kamuy 4", genres: [
                    "Action",
                    "Adventure",
                    "History",
                    "Western"
                ], rating: 9.5, mpa_rating: "R", year: 2027, runtime: 155, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2027/medium-cover.jpg", cast: [
                    CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                    CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
                ], description_full: "The epic conclusion of Saichi Sugimoto's quest for the Ainu gold, with intense battles and dramatic revelations."),
                MovieListModel(id: 6, title: "Golden Kamuy 4", genres: [
                    "Action",
                    "Adventure",
                    "History",
                    "Western"
                ], rating: 9.5, mpa_rating: "R", year: 2027, runtime: 155, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2027/medium-cover.jpg", cast: [
                    CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                    CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
                ], description_full: "The epic conclusion of Saichi Sugimoto's quest for the Ainu gold, with intense battles and dramatic revelations."),
                MovieListModel(id: 7, title: "Golden Kamuy 4", genres: [
                    "Action",
                    "Adventure",
                    "History",
                    "Western"
                ], rating: 9.5, mpa_rating: "R", year: 2027, runtime: 155, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2027/medium-cover.jpg", cast: [
                    CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                    CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
                ], description_full: "The epic conclusion of Saichi Sugimoto's quest for the Ainu gold, with intense battles and dramatic revelations."),
                MovieListModel(id: 8, title: "Golden Kamuy 4", genres: [
                    "Action",
                    "Adventure",
                    "History",
                    "Western"
                ], rating: 9.5, mpa_rating: "R", year: 2027, runtime: 155, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2027/medium-cover.jpg", cast: [
                    CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                    CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
                ], description_full: "The epic conclusion of Saichi Sugimoto's quest for the Ainu gold, with intense battles and dramatic revelations.")
            ]
        }
        
        static func example1() -> MovieListModel {
            MovieListModel(id: 10, title: "Golden Kamuy", genres: [
                "Action",
                "Adventure",
                "History",
                "Western"
            ], rating: 9.3, mpa_rating: "R", year: 2024, runtime: 142, medium_cover_image: "https://yts.mx/assets/images/movies/golden_kamuy_2024/medium-cover.jpg", cast: [
                CastData(name: "Chikahiro Kobayashi", character_name: "Saichi Sugimoto", url_small_image: "https://example.com/image1.jpg", imdb_code: "nm1234567"),
                CastData(name: "Haruka Shiraishi", character_name: "Asirpa", url_small_image: "https://example.com/image2.jpg", imdb_code: "nm2345678")
            ], description_full: "In the early 20th century, Russo-Japanese War veteran Saichi Sugimoto searches for a vast fortune of gold hidden by the Ainu people.")
        }
}

