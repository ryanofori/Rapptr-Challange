//
//  NetworkError.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/7/22.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case decodingError
    case responseError
    case unknownError
}
