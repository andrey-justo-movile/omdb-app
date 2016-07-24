//
//  AddMovieViewController.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import Foundation
import UIKit

protocol DetailMovieInImdbProtocol {
    func fillDetails(movie: MovieDB?)
}

class AddMovieViewController: UIViewController {

    let detailSegue = "movieDetailSegue"
    let httpService = HttpService()
    var movie: MovieDB?
    var detailViewController: DetailMovieInImdbProtocol?

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var containerView: UIView!

    @IBAction func search(sender: AnyObject) {
        if let text = inputText.text {
            httpService.searchMoviesByTitle(text, success: { [weak self] movie in
                    self?.movie = movie.transform()
                    self?.detailViewController?.fillDetails(self?.movie)
                self?.view.endEditing(true)
                }, errorBlock: { error in
                    // TODO handle error
            })
        }
    }

    @IBAction func add(sender: AnyObject) {
        if let movie = self.movie {
            DatabaseProvider.insertAllObjects([movie])
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == detailSegue {
            let vc = segue.destinationViewController as? MovieDetailViewController

            detailViewController = vc
        }
    }
}