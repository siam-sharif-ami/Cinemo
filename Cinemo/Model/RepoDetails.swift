//
//  RepoDetails.swift
//  Cinemo
//
//  Created by BS00484 on 30/5/24.
//

import Foundation
struct RepoDetails: Codable {
    var movie: MovieListModel
    
    static func example1() -> RepoDetails {
        return RepoDetails(movie: MovieListModel.example1())
    }
}
