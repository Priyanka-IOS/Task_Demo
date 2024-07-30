//
//  MoviesViewModel.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 14/07/24.
//

import Foundation

protocol MoviesViewModelDelegate:AnyObject {
    func reloadData()
}

class MoviesViewModel{
    weak var delegate:MoviesViewModelDelegate?
    var moviesData:[MoviesDataModel]?
    
    // MARK: GetMoviesData
    func fetchMoviesData(serachText: String = String()) {
        
        if serachText.isEmpty && serachText.count < 2 {
            return
        }
        guard let URLType = URL(string: Constants.searchUrl + serachText) else { return  }
        NetworkManager.shared.request(fromURL: URLType) { (result: Result<MoviesSearchDataModel, Error>) in
            
            switch result{
            case .success(let movies):
                self.moviesData = movies.search
                self.delegate?.reloadData()
   
            case .failure(let error):
                print(error)
            }
        }
    }
}
