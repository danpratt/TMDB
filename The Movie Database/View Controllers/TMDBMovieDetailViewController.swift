//
//  TMDBMovieDetailViewController.swift
//  The Movie Database
//
//  Created by Daniel Pratt on 11/2/18.
//  Copyright © 2018 Blau Magier. All rights reserved.
//

import UIKit

class TMDBMovieDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewDetail: UITextView!
    
    // MARK: - Params
    
    var movie: Movie!
    let client = TMDBClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard movie != nil else { return }
        
        titleLabel.text = movie.title
        overviewDetail.text = movie.overview
        
        if let average = movie.vote_average {
            let rating = String(format:"%.1f", average)
            ratingLabel.text = "\(rating)/10"
        }
        
        if let posterPath = movie.poster_path {
            let _ = client.taskForGETImage(ImageKeys.PosterSizes.DetailPoster, filePath: posterPath) { (data, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self.moviePosterImage.image = image
                    }
                }
            }
        }
        
        if let bannerPath = movie.backdrop_path {
            let _ = client.taskForGETImage(ImageKeys.PosterSizes.DetailPoster, filePath: bannerPath) { (data, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self.backgroundImage.image = image
                    }
                }
            }
        }
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        moviePosterImage.contentMode = .scaleAspectFit
        backgroundImage.contentMode = .scaleToFill
        overviewDetail.scrollRectToVisible(CGRect.zero, animated: true)
    }

}
