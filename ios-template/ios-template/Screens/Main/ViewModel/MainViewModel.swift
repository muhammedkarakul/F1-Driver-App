//
//  MainViewModel.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

typealias Response = DriverList

protocol MainViewModelDelegate: AnyObject {
    func didErrorOccurred(_ error: NetworkError)
    func didResponseReceived(_ response: Response)
}

final class MainViewModel: ViewModel {
    // MARK: - Properties
    weak var delegate: MainViewModelDelegate?

    private var service = Service()

    private var response: Response?

    var numberOfRowsInSection: Int {
        response?.items.count ?? .zero
    }

    // MARK: - Methods
    func configureTableViewCell(_ cell: UITableViewCell, forIndexPath indexPath: IndexPath) {
        guard let driver = response?.items[indexPath.row] else { return }
        cell.textLabel?.text = "\(driver.name)"
    }

    func getDriverList() {
        service.getDriverList { result in
            switch result {
            case .failure(let error):
                self.delegate?.didErrorOccurred(error)
            case .success(let response):
                self.response = response
                self.delegate?.didResponseReceived(response)
            }
        }
    }
}
