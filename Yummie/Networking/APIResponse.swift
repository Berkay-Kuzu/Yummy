//
//  APIResponse.swift
//  Yummie
//
//  Created by Berkay Kuzu on 4.03.2023.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let status: Int?
    let message: String?
    let data: T?
    let error: String?
}
