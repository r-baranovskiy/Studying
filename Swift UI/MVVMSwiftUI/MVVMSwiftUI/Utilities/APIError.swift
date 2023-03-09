//
//  APError.swift
//  SwiftUI-MVVM
//
//  Created by Sean Allen on 5/24/21.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
