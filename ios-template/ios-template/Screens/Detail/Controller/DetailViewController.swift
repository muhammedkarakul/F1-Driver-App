//
//  DetailViewController.swift
//  ios-template
//
//  Created by Muhammed Karakul on 28.07.2021.
//

import Foundation

final class DetailViewController: BaseViewController<DetailView> {
    // MARK: - Properties
    private let viewModel = DetailViewModel()

    var driverId: Int?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = driverId else { return }
        showProgressHUD()
        viewModel.getDriverDetail(withId: id)
    }

    // MARK: - Setup
    override func linkInteractor() {
        super.linkInteractor()
        viewModel.delegate = self
    }
}

// MARK: - DetailViewModelDelegate
extension DetailViewController: DetailViewModelDelegate {
    func didErrorOccurred(_ error: NetworkError) {
        hideProgressHUD()
        showError(error)
    }

    func didResponseReceived(_ response: DriverDetail) {
        hideProgressHUD()
        viewModel.configureDetailView(baseView)
    }
}
