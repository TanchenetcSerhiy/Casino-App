//
//  Errors.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 19.08.2021.
//

import Foundation

enum ErrorType: String {
    case loadGamesError = "Couldn't load games"
}

/// Errors for application
public class CustomError: Error, Codable {
    var code: Int = 0
    var message: String = ""
    
    convenience init(errorType: ErrorType) {
        self.init()
        
        message = errorType.rawValue
    }
}
