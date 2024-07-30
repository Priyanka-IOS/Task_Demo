//
//  MovieDetailsViewModel.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 15/07/24.
//

import Foundation

protocol MovieDetailsViewModelDelegate:AnyObject {
    func reloadData()
}
class MovieDetailsViewModel {

    // MARK:Variable
    var moviesDetailsData: MovieDetailsModel?
    weak var delegate:MovieDetailsViewModelDelegate?
    
    // MARK: GetMoviesData
    func fetchMoviesdetailsData(moviesId: String) {
        let urlStr = String(format: Constants.movieDeatilsUrlPath , moviesId)
        guard let URLType = URL(string: urlStr) else { return  }
        NetworkManager.shared.request(fromURL: URLType) { (result: Result<MovieDetailsModel, Error>) in
            
            switch result{
            case .success(let movies):
                print(movies)
                self.moviesDetailsData = movies
                self.delegate?.reloadData()
   
            case .failure(let error):
                print(error)
            }
        }
    }
}
