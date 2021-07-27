//
//  MainViewController.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

class MainViewController: BaseViewController<MainView> {
    // MARK: - Properties
    var viewModel = MainViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        title = "F1 Driver List"
    }
}

// MARK: - MainViewModelDelegate
extension MainViewController: MainViewModelDelegate {
    func didErrorOccurred(_ error: NetworkError) {
        showError(error)
    }

    func didResponseReceived(_ response: Response) {
        baseView.refresh()
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {

}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        viewModel.configureTableViewCell(cell, forIndexPath: indexPath)
        return cell
    }
}
