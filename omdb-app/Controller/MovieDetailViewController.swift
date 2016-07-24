//
//  MovieDetailVIewController.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/24/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController, DetailMovieInImdbProtocol {

    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!

    private let dateFormatter = NSDateFormatter()
    private let format = "dd/MM/YYYY"

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = format

        yearLabel.preferredMaxLayoutWidth = self.view.frame.width - 150
        titleLabel.preferredMaxLayoutWidth = self.view.frame.width - 150
        ratingLabel.preferredMaxLayoutWidth = self.view.frame.width - 150
        releasedLabel.preferredMaxLayoutWidth = self.view.frame.width - 150
        runtimeLabel.preferredMaxLayoutWidth = self.view.frame.width - 150
        plotLabel.preferredMaxLayoutWidth = self.view.frame.width - 60
        countryLabel.preferredMaxLayoutWidth = self.view.frame.width/2 - 70
        languageLabel.preferredMaxLayoutWidth = self.view.frame.width/2 - 80

        emptyDetails()
    }

    func emptyDetails() {
        yearLabel.text = ""
        titleLabel.text = ""
        ratingLabel.text = ""
        releasedLabel.text = ""
        runtimeLabel.text = ""
        plotLabel.text = ""
        countryLabel.text = ""
        languageLabel.text = ""
    }

    func fillDetails(movie: MovieDB?) {
        if let movie = movie {
            yearLabel.text = movie.year
            titleLabel.text = movie.title
            ratingLabel.text = "\(movie.imdbRating)"
            let mapCountryNames = movie.countries.map { $0.name }
            countryLabel.text = mapCountryNames.joinWithSeparator(",")
            let mapLanguageNames = movie.languages.map { $0.lang }
            languageLabel.text = mapLanguageNames.joinWithSeparator(",")
            plotLabel.text = movie.plot
            releasedLabel.text = dateFormatter.stringFromDate(movie.released)
            runtimeLabel.text = "\(movie.runtime)"
            posterImageView.sd_setImageWithURL(NSURL(string: movie.poster))
        } else {
            emptyDetails()
        }
    }
    
}