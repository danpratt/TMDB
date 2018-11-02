//
//  TMDBMovieTableViewCell.swift
//  The Movie Database
//
//  Created by Daniel Pratt on 11/2/18.
//  Copyright © 2018 Blau Magier. All rights reserved.
//

import UIKit

class TMDBMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    override func prepareForReuse() {
        moviePoster.image = UIImage(named: "Movie_Poster_Placeholder")
        movieTitle.text = ""
        movieOverview.text = ""
    }
}
