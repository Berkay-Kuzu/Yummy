//
//  AppError.swift
//  Yummie
//
//  Created by Berkay Kuzu on 4.03.2023.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded!"
        case .unknownError:
            return "Unkonw Error!"
        case .invalidUrl:
            return "Give me a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
