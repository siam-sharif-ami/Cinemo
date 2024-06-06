//
//  UserInfo.swift
//  Cinemo
//
//  Created by BS00484 on 6/6/24.
//

import Foundation

struct UserInfo : Identifiable, Codable{
    let id: String
    let fullname: String?
    let email: String?
}
