//
//  DetailViewModel.swift
//  ios-template
//
//  Created by Muhammed Karakul on 28.07.2021.
//

import Kingfisher

protocol DetailViewModelDelegate: AnyObject {
    func didErrorOccurred(_ error: NetworkError)
    func didResponseReceived(_ response: DriverDetail)
}

final class DetailViewModel {
    // MARK: - Properties
    weak var delegate: DetailViewModelDelegate?

    private var service = Service()

    var response: DriverDetail?

    // MARK: - Methods
    func getDriverDetail(withId id: Int) {
        service.getDriverDetail(withId: id) { result in
            switch result {
            case .failure(let error):
                self.delegate?.didErrorOccurred(error)
            case .success(let response):
                self.response = response
                self.delegate?.didResponseReceived(response)
            }
        }
    }

    func configureDetailView(_ view: DetailView) {
        guard let response = response, let imageURL = URL(string: response.image) else { return }
        view.imageView.kf.setImage(with: imageURL)
        view.teamInfo = response.team
        view.age = response.age
    }
}
