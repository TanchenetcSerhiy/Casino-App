//
//  ViewController.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 16.08.2021.
//

import UIKit
import WebKit

final class GameListViewController: UIViewController {
    //=========================================================
    // MARK: - Variables
    //=========================================================
    private var games: [Game] = [] {
        didSet {
            self.title = "Total Games Number: \(games.count)"
        }
    }
    
    //=========================================================
    // MARK: - Life cycle
    //=========================================================
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupWebView()
    }

    //=========================================================
    // MARK: - Private
    //=========================================================
    private func setupWebView() {
        guard let gamesURL = URL(string: Constants.Endpoints.baseURL) else {
            print("Couldn't create URL")
            showAlert(message: ErrorType.loadGamesError.rawValue)
            return
        }
        
        let configuration = WKWebViewConfiguration()
        let userContentController = WKUserContentController()
        
        userContentController.add(self, name: Constants.MessageHandler.toggleMessage)
        userContentController.add(self, name: Constants.MessageHandler.gameListMessage)
        configuration.userContentController = userContentController
        
        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        let request = URLRequest(url: gamesURL)
        webView.navigationDelegate = self
        webView.load(request)
    }
    
    private func showDetailsVC(with game: Game) {
        guard let gameDetailsVC = UIStoryboard.get(flow: .main).get(controller: .gameDetails) as? GameDetailsViewController else {
            return
        }
        
        gameDetailsVC.set(game)
        navigationController?.pushViewController(gameDetailsVC, animated: true)
    }
}

//=========================================================
// MARK: - WKScriptMessageHandler, WKNavigationDelegate
//=========================================================
extension GameListViewController: WKScriptMessageHandler, WKNavigationDelegate {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        WebViewMessageHelper.handle(with: message) { [weak self] games, seletedGameCode, errorMessage in
            DispatchQueue.main.async {
                if let error = errorMessage {
                    self?.showAlert(message: error.message)
                }
                
                if let games = games {
                    self?.games = games
                }
                
                if let seletedGameCode = seletedGameCode,
                   let selectedGame = self?.games.first(where: { $0.code == seletedGameCode }) {
                    self?.showDetailsVC(with: selectedGame)
                }
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showAlert(message: error.localizedDescription)
    }
}
