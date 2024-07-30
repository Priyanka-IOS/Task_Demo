//
//  MovieDetailsViewController.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 14/07/24.
//

import UIKit

class MovieDetailsViewController: UIViewController, MovieDetailsViewModelDelegate {

    @IBOutlet weak var movieDeatilsTblView: UITableView!
    var movieDetailsViewModel = MovieDetailsViewModel()
    var moviesId: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    // MARK: TableView
    func setUpTableView() {
        movieDeatilsTblView.delegate = self
        movieDeatilsTblView.dataSource = self
        movieDeatilsTblView.register(UINib(nibName: Constants.moviesDeatilsCellId, bundle: nil), forCellReuseIdentifier: Constants.moviesDeatilsCellId)
        movieDetailsViewModel.delegate = self
        movieDetailsViewModel.fetchMoviesdetailsData(moviesId: moviesId ?? String())

    }
    func reloadData() {
        movieDeatilsTblView.reloadData()
    }
    
}
// MARK: - Table view data source & Delegate
extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.moviesDeatilsCellId, for: indexPath) as? MovieDetailsTableViewCell else { return UITableViewCell() }
        cell.setUpMovieDeatils(deatilsMovie: movieDetailsViewModel.moviesDetailsData)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}
