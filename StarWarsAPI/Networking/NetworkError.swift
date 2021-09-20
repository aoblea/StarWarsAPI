//
//  NetworkError.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/16/21.
//

// MARK: - NetworkError
enum NetworkError: Error {
    case urlError
    case responseUnsuccessful
    case statusCodeError
    case decodingFailed
}

extension NetworkError {
    var localizedDescription: String {
        switch self {
        case .urlError: return "URL Error"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .statusCodeError: return "Status code error"
        case .decodingFailed: return "Decoding failure"
        }
    }
}
