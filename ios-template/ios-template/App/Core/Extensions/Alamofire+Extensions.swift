//
//  Alamofire+Extensions.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import Alamofire
import Reachability

public enum NetworkError: Error {
    case invalidURL
    case internalError(AFError)
    case decodeError(Error)
    case connectionError
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .connectionError:
            return "İnternet bağlantısı bulunamadı. Lütfen internet bağlantınızı kontrol edip tekrar deneyin."
        case .invalidURL, .internalError, .decodeError:
            return "Beklenmedik bir hata oluştu. Lütfen daha sonra tekrar deneyiniz."
        }
    }
}

extension Session: ProgressHUDPresentable {

    func request<T: EndpointType, E: Decodable>(endpoint: T, dataType: E.Type, completion: @escaping (Result<E, NetworkError>) -> Void) {

        guard let endpointURL = endpoint.url else {
            completion(.failure(.invalidURL))
            return
        }

        let reachability = try! Reachability()
        switch reachability.connection {
        case .unavailable:
            completion(.failure(.connectionError))
        default:
            break
        }

        showProgressHUD()
        request(endpointURL,
                method: endpoint.method,
                parameters: endpoint.parameters,
                encoding: endpoint.encoding,
                headers: endpoint.headers
        ).responseDecodable(of: E.self) { (response) in
            self.hideProgressHUD()
            if let error = response.error {
                completion(.failure(.internalError(error)))
            } else if let value = response.value {
                completion(.success(value))
            }
        }
    }
}

protocol EndpointType {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var path: String { get }
}

extension EndpointType {

    var baseURL: URL {
        URL(string: "http://my-json-server.typicode.com/oguzayan/kuka/")!
    }

    var headers: HTTPHeaders? {
        nil
    }

    var encoding: ParameterEncoding {
        JSONEncoding.default
    }

    /// Returns the builded endpoint URL.
    var url: URL? {
        var url = baseURL
        url.appendPathComponent(path)
        return url
    }
}
