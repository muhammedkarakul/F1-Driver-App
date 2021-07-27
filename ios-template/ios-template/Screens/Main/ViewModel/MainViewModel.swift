//
//  MainViewModel.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

protocol MainViewModelDelegate: AnyObject {
    func didErrorOccurred(_ error: NetworkError)
    func didResponseReceived(_ response: DriverList)
}

final class MainViewModel: ViewModel {
    // MARK: - Properties
    weak var delegate: MainViewModelDelegate?

    private var service = Service()

    private var response: DriverList? {
        didSet {
            orderedDrivers = response?.items.sorted(by: { $0.point > $1.point })
        }
    }

    private var orderedDrivers: [Driver]?

    var numberOfRowsInSection: Int {
        orderedDrivers?.count ?? .zero
    }

    // MARK: - Methods
    func configureDriverTableViewCell(_ cell: DriverTableViewCell, forIndexPath indexPath: IndexPath) {
        guard let driver = orderedDrivers?[indexPath.row] else { return }
        cell.title = driver.name
        cell.point = driver.point
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

    func getDriverId(forIndexPath indexPath: IndexPath) -> Int? {
        orderedDrivers?[indexPath.row].id
    }
}
