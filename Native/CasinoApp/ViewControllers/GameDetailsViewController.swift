//
//  GameDetailsViewController.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 18.08.2021.
//

import UIKit

final class GameDetailsViewController: UIViewController {
    //=========================================================
    // MARK: - Outlets, Variables
    //=========================================================
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var game: Game?
    
    //=========================================================
    // MARK: - Life Cycle
    //=========================================================
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    //=========================================================
    // MARK: - Public
    //=========================================================
    func set(_ game: Game) {
        self.game = game
    }
    
    //=========================================================
    // MARK: - Private
    //=========================================================
    private func setupUI() {
        titleLabel.text = game?.name
        descriptionLabel.text = game?.description
        if let color = UIColor(hex: game?.theme ?? "") {
            view.backgroundColor = color
        }
    }
}
