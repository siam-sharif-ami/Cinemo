//
//  StatusResponse.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import Foundation

struct StatusResponse: Codable {
    let status: String
    let statusMessage: String 
    
    enum CodingKeys: String, CodingKey {
        case status
        case statusMessage = "status_message"
    }
}
