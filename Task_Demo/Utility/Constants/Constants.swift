//
//  Constants.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 14/07/24.
//

import Foundation

public struct Constants {
    
    public static let searchUrl = "?apikey=35955ad7&type=movie&s="
    public static let movieDeatilsUrlPath = "?i=%@&apikey=35955ad7"

    
    public static let moviesCellId = "MoviesTableViewCell"
    public static let moviesDeatilsCellId = "MovieDetailsTableViewCell"

//https://www.omdbapi.com/?i=tt1285241&apikey=35955ad7
}
struct BaseUrl {
    struct ProductionServer {
        static let baseUrl = "https://www.omdbapi.com/"
    }
}
