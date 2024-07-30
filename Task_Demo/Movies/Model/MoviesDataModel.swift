//
//  MoviesDataModel.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 14/07/24.
//

import Foundation

// MARK: - Search
struct MoviesDataModel: Codable {
    let title, year, imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

