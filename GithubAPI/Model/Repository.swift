//
//  Reepository.swift
//  GithubAPI
//
//  Created by nekuro on 2021/06/13.
//

import Foundation

struct Repository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stargazersCount = "stargazers_count"
    }
}
