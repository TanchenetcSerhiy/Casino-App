//
//  Decodable+Utils.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 17.08.2021.
//

import Foundation

extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}
