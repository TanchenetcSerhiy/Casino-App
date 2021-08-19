//
//  Game.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 17.08.2021.
//

import Foundation

struct Game: Decodable {
    let id: Int
    let name: String
    let code: String
    let icon: String
    let theme: String
    let description: String
    let shortDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case code
        case icon
        case theme
        case description
        case shortDescription = "short_desc"
    }
}
