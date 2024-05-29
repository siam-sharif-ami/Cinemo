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
    let description_full: String
    let mpa_rating: String
    let medium_cover_image: String
    let cast: [CastData]?
    
    static func example1() -> MovieDetailsModel {
        MovieDetailsModel(
            
            
            id: 1,
            title: "The Shawshank Redemption",
            year: 1994,
            rating: 9.3,
            runtime: 142,
            
            genres: ["Drama", "Crime"],
            description_full: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            mpa_rating: "R",
            medium_cover_image: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
            
            cast: [
                CastData(
                    name: "Annabeth Gish",
                         character_name: "Ellis Boyd Redding",
                         url_small_image: "https://yts.mx/assets/images/actors/thumb/nm0000112.jpg",
                         imdb_code: "nm0000151"),
                CastData(
                    name: "Matt Frewer",
                    character_name: "Ellis Boyd Redding",
                    url_small_image: "https://yts.mx/assets/images/actors/thumb/nm0001242.jpg",
                    imdb_code: "nm0000151")
                
                
            ]
        )
    }
}
