//
//  TMDBNowPlayingViewController.swift
//  The Movie Database
//
//  Created by Daniel Pratt on 11/2/18.
//  Copyright © 2018 Blau Magier. All rights reserved.
//

import UIKit

class TMDBNowPlayingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

extension TMDBNowPlayingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNowPlaying", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = "A cell"
        
        return cell
    }
    
    
    
    
}
