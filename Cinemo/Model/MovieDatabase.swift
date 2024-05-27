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
}


