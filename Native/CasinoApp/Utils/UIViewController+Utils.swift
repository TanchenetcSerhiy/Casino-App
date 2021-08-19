//
//  UIViewController+Utils.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 18.08.2021.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String? = "Error", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
