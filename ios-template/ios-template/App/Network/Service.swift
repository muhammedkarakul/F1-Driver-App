//
//  Service.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import Foundation

final class Service {

    private let session = APISession.shared.session

    func getDriverList(completion: @escaping (Result<DriverList, NetworkError>) -> Void) {
        session.request(endpoint: Endpoint.driverList,
                        dataType: DriverList.self,
                        completion: completion)
    }

    func getDriverDetail(withId id: Int, completion: @escaping (Result<DriverDetail, NetworkError>) -> Void) {
        session.request(endpoint: Endpoint.driverDetail(id: id),
                        dataType: DriverDetail.self,
                        completion: completion)
    }
}
