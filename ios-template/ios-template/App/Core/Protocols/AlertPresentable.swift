//
//  AlertPresentable.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

protocol AlertPresentable {}

extension AlertPresentable where Self: UIViewController {

    private func showAlert(title: String? = nil,
                           message: String? = nil,
                           style: UIAlertController.Style = .alert,
                           actions: UIAlertAction...) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)

        for action in actions {
            alertController.addAction(action)
        }

        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }

    func showError(_ error: Error, completion: ((UIAlertAction) -> Void)? = nil) {

        let action = UIAlertAction(title: "Tamam", style: .default, handler: completion)
        showAlert(title: "Hata",
                  message: error.localizedDescription,
                  style: .alert,
                  actions: action)
    }
}
