//
//  MovieDetailsModel.swift
//  Cinemo
//
//  Created by BS00484 on 28/5/24.
//

import Foundation

struct MovieDetailsModel : Codable, Identifiable {
    
    let id: Int
    let title: String
    let year: Int
    let rating: Double
    let runtime: Int
    let genres: [String]
    let description_intro: String
    let mpa_rating: String
    let large_cover_image: String
    let cast: [CastData]
    
    static func example1() -> MovieDetailsModel {
        MovieDetailsModel(
            
            
            id: 1,
            title: "The Shawshank Redemption",
            year: 1994,
            rating: 9.3,
            runtime: 142,
            
            genres: ["Drama", "Crime"],
            description_intro: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            mpa_rating: "R",
            large_cover_image: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
            
            cast: [
                CastData(name: "Morgan Freeman",
                         character_name: "Ellis Boyd Redding",
                         url_small_image: "https://image.tmdb.org/t/p/w185/oGJQhOpT8S1M56tvLJc4i8o0ASQ.jpg",
                         imdb_code: "nm0000151"),
                CastData(
                    name: "Morgan Freeman",
                    character_name: "Ellis Boyd Redding",
                    url_small_image: "https://image.tmdb.org/t/p/w185/oGJQhOpT8S1M56tvLJc4i8o0ASQ.jpg",
                    imdb_code: "nm0000151")
                
            ]
        )
    }
}
