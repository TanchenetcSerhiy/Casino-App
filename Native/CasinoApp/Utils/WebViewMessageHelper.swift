//
//  WebViewMessageHelper.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 19.08.2021.
//

import WebKit

final class WebViewMessageHelper {
    
    static func handle(with message: WKScriptMessage,
                       completion: @escaping (_ games: [Game]?, _ selectedGame: String?, _ error: CustomError?) -> Void) {
        guard let body = message.body as? [String: Any] else {
            completion(nil, nil, CustomError(errorType: .loadGamesError))
            return
        }
        
        if message.name == Constants.MessageHandler.gameListMessage {
            guard let data = body["games"] else {
                completion(nil, nil, CustomError(errorType: .loadGamesError))
                return
            }
            do {
                let gamesData = try JSONSerialization.data(withJSONObject: data, options: [])
                let games = try [Game].decode(data: gamesData)
                completion(games, nil, nil)
            } catch {
                completion(nil, nil, CustomError(errorType: .loadGamesError))
            }
        } else if message.name == Constants.MessageHandler.toggleMessage {
            guard let gameCode = body["gameChosen"] as? String else {
                completion(nil, nil, CustomError(errorType: .loadGamesError))
                return
            }
            
            completion(nil, gameCode, nil)
        }
    }
}
