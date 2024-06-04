//
//  MovieDatabase.swift
//  Cinemo
//
//  Created by BS00484 on 20/5/24.
//

import Foundation

struct MovieDatabase: Codable {
    
    let status: String
    let status_message: String
    let data: RepoData
    
    static func example1()-> MovieDatabase {
        MovieDatabase(status: "ok", status_message: "Query was successful", data: RepoData(movies: MovieListModel.examples()))
    }
}


