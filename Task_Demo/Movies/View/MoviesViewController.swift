//
//  MoviesViewController.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 14/07/24.
//

import UIKit

class MoviesViewController: UIViewController,MoviesViewModelDelegate {
    
    // MARK:Variable
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    var moviesViewModel = MoviesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    // MARK: TableView
    func setUpTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.separatorColor = .clear
        searchBar.delegate = self
        moviesTableView.register(UINib(nibName: Constants.moviesCellId, bundle: nil), forCellReuseIdentifier: Constants.moviesCellId)
        moviesViewModel.delegate = self
        moviesViewModel.fetchMoviesData()
    }
    func reloadData() {
        moviesTableView.reloadData()
    }
}
// MARK: - Table view data source & Delegate
extension MoviesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.moviesData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.moviesCellId, for: indexPath) as! MoviesTableViewCell
        cell.setUpMoviesData(moviesData: moviesViewModel.moviesData?[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        vc.moviesId = moviesViewModel.moviesData?[indexPath.row].imdbID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

// MARK: - Search Bar Delegate
extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            self?.moviesViewModel.fetchMoviesData(serachText: searchText)
        }
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = String()
        searchBar.resignFirstResponder()
    }
}
