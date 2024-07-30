//
//  MoviesSearchViewModelTest.swift
//  Task_DemoTests
//
//  Created by Priyanka Ghosh on 17/07/24.
//

import XCTest
@testable import Task_Demo

final class MoviesSearchViewModelTest: XCTestCase {
    var moviesViewModel: MoviesViewModel?
    
    override func setUpWithError() throws {
        moviesViewModel = MoviesViewModel()
    }
    override func tearDownWithError() throws {
        moviesViewModel = nil
    }
    func testforMovieSearchApi() {
        XCTAssertNotNil(moviesViewModel?.fetchMoviesData(serachText: "DON"))
    }
    func testforMovieSearchApiCall() {
        
        let expection = expectation(description: "MovieSearchApi")
        NetworkManager.shared.request(fromURL: URL(string: "https://www.omdbapi.com/?apikey=35955ad7&type=movie&s=DOn")!) { (result: Result<MoviesSearchDataModel, Error>) in
            switch result{
                
            case .success(let movies):
                XCTAssertNotNil(movies)
   
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expection.fulfill()
        }
        waitForExpectations(timeout: 60.0, handler: nil)
    }

    // MARK: Test With Mock Data
    func test_ParsingValidJSON_ReturnsMovieDataModel() {
        
        let movieListData = TestUtility.readJSONFromFile(fileName: "MovieSearchMockData", type: MoviesSearchDataModel.self)
        var movieData = movieListData?.search[0]
        
        XCTAssertNotNil(movieListData?.search)
        XCTAssertEqual(movieData?.title, "Don Jon")
        XCTAssertEqual(movieData?.poster, "https://m.media-amazon.com/images/M/MV5BN2ZhY2IzMWQtMGU4MC00ODg2LThkNWMtNWMzYmM2OTc5ZDMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg")
        XCTAssertNotNil(movieData?.imdbID)
        XCTAssertEqual(movieData?.year, "2013")
    }

}
