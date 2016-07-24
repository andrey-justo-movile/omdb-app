//
//  ListMovieViewController.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class ListMovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let movieCellIdentifier = "movieCell"
    @IBOutlet weak var moviesTableView: UITableView!

    // TODO implement pagination
    var movies: Results<MovieDB>?

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        fillTableView()
    }

    func fillTableView() {
        movies = DatabaseProvider.fechtAllMoviesOrderedByTitle()
        moviesTableView.reloadData()
    }

    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCellWithIdentifier(movieCellIdentifier, forIndexPath: indexPath) as! MovieTableViewCell

        if let posterURL = movies?[indexPath.row].poster {
            cell.movieImageView.sd_setImageWithURL(NSURL(string: posterURL))
        }
        cell.movieTitleLabel.text = movies?[indexPath.row].title
        cell.yearLabel.text = movies?[indexPath.row].year

        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let addMovieVC = self.storyboard?.instantiateViewControllerWithIdentifier("addMovieVC") as? AddMovieViewController
        if let addMovieVC = addMovieVC {
            addMovieVC.movie = movies?[indexPath.row]
            addMovieVC.onlyRead = true
            self.navigationController?.pushViewController(addMovieVC, animated: true)
        }
    }
}