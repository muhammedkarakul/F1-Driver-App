//
//  MainViewController.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

class MainViewController: BaseViewController<MainView> {
    // MARK: - Properties
    private let viewModel = MainViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showProgressHUD()
        viewModel.getDriverList()
    }

    // MARK: - Setup
    override func linkInteractor() {
        super.linkInteractor()
        viewModel.delegate = self
        baseView.setTableViewDelegate(self, andDataSource: self)
    }

    override func configureAppearance() {
        super.configureAppearance()
        title = "F1 Pilotları"
    }
}

// MARK: - MainViewModelDelegate
extension MainViewController: MainViewModelDelegate {
    func didErrorOccurred(_ error: NetworkError) {
        hideProgressHUD()
        showError(error)
    }

    func didResponseReceived(_ response: DriverList) {
        hideProgressHUD()
        baseView.refresh()
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.driverId = viewModel.getDriverId(forIndexPath: indexPath)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DriverTableViewCell
        cell.delegate = self
        viewModel.configureDriverTableViewCell(cell, forIndexPath: indexPath)
        return cell
    }
}

// MARK: - DriverTableViewCellDelegate
extension MainViewController: DriverTableViewCellDelegate {
    func driverTableViewCell(_ cell: DriverTableViewCell, didTapAddFavoriteButton button: UIButton) {
        cell.isFavorite.toggle()
    }
}
