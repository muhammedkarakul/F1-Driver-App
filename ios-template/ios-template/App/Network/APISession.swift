//
//  APISession.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import Alamofire

class APISession {
    static var shared = APISession()

    let session: Session

    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        configuration.timeoutIntervalForResource = 30.0
        self.session = Session(configuration: configuration, eventMonitors: [Logger()])
    }
}
