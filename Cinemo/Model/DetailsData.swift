//
//  DetailsData.swift
//  Cinemo
//
//  Created by BS00484 on 28/5/24.
//

import Foundation
struct DetailsData : Codable {
    var data: RepoDetails
    
    static func example1() -> DetailsData {
        return DetailsData(data: RepoDetails.example1())
    }
}
