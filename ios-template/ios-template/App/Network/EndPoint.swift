//
//  EndPoint.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import Alamofire

enum Endpoint: EndpointType {
    case driverList
    case driverDetail(id: Int)

    var method: HTTPMethod {
        .get
    }

    var parameters: Parameters? {
        switch self {
        case .driverList, .driverDetail:
            return nil
        }
    }

    var path: String {
        switch self {
        case .driverList:
            return "drivers"
        case .driverDetail(let id):
            return "driverDetail/\(id)"
        }
    }
}
