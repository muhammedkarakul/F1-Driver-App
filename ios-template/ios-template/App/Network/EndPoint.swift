//
//  EndPoint.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import Alamofire

enum Endpoint: EndpointType {
    case driverList

    var method: HTTPMethod {
        .get
    }

    var parameters: Parameters? {
        switch self {
        case .driverList:
            return nil
        }
    }

    var path: String {
        switch self {
        case .driverList:
            return "drivers"
        }
    }
}
