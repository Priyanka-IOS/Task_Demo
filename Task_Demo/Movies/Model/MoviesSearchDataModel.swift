//
//  MoviesSearchDataModel.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 14/07/24.
//

import Foundation

// MARK: - MoviesSearchDataModel
struct MoviesSearchDataModel: Codable {
    let search: [MoviesDataModel]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}
