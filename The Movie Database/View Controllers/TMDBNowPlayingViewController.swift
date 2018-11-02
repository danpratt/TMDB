//
//  TMDBNowPlayingViewController.swift
//  The Movie Database
//
//  Created by Daniel Pratt on 11/2/18.
//  Copyright © 2018 Blau Magier. All rights reserved.
//

import UIKit

class TMDBNowPlayingViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nowPlayingTableView: UITableView!
    
    // MARK: - Class Properties
    
    let client = TMDBClient()
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNowPlayingData()
    }
    
    // MARK: - Function to load data
    
    private func loadNowPlayingData(onPage page: Int = 1) {
        let _ = client.taskForGETMethod(Methods.NowPlaying, parameters: [ParameterKeys.Page: page as AnyObject]) { (data, error) in
            if error == nil, let jsonData = data {
                let result = Result.decode(jsonData: jsonData)
                if let movieResults = result?.results {
                    self.movies += movieResults
                    print("~>Number of pages: \(String(describing: result?.total_pages))")
                    print("~>Currently on page: \(String(describing: result?.page))")
                    DispatchQueue.main.async {
                        self.nowPlayingTableView.reloadData()
                    }
                }
                
                if let totalPages = result?.total_pages, page < totalPages {
                    self.loadNowPlayingData(onPage: page + 1)
                }
                
                
            } else {
                print("~>There was an error: \(String(describing: error?.userInfo))")
            }
        }
    }

}

extension TMDBNowPlayingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellNowPlaying", for: indexPath) as? TMDBMovieTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellNowPlaying", for: indexPath) as UITableViewCell
            cell.textLabel?.text = "Unable to load movie."
            return cell
        }
        
        guard movies.count > indexPath.row else {
            cell.movieTitle.text = "Unable to load movie."
            return cell
        }
        
        let movie = movies[indexPath.row]
        cell.movieTitle.text = movie.title
        cell.movieOverview.text = movie.overview
        
        // load movie poster async
        
        return cell
    }
    
    
    
    
}
