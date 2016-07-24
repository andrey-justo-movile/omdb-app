//
//  Movie.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import Foundation
import Freddy

public struct Movie {

    private let dateFormatter = NSDateFormatter()
    private let format = "dd MMM YYYY"

    let title: String
    let year: String
    let rated: String
    let released: NSDate
    let runtime: String
    let genres: [String]
    let director: String
    let writers: [String]
    let actors: [String]
    let plot: String
    let languages: [String]
    let countries: [String]
    let awards: String
    let poster: String
    let metascore: Int
    let imdbRating: Double
    let imdbVotes: Int
    let imdbID: String
    let type: String
    let response: Bool
    
}

// MARK: JSONDecodable protocol
extension Movie: JSONDecodable {

    public init(json: JSON) throws {
        dateFormatter.dateFormat = format

        imdbID = try json.decode("imdbID")
        title = try json.decode("Title")
        year = try json.decode("Year")
        rated = try json.decode("Rated")
        runtime = try json.decode("Runtime")
        director = try json.decode("Director")
        plot = try json.decode("Plot")
        awards = try json.decode("Awards")
        poster = try json.decode("Poster")
        type = try json.decode("Type")

        let countyJson: String = try json.decode("Country")
        countries = countyJson.characters.split(",").map(String.init)

        let languageJson: String = try json.decode("Language")
        languages = languageJson.characters.split(",").map(String.init)

        let actorJson: String = try json.decode("Actors")
        actors = actorJson.characters.split(",").map(String.init)

        let writerJson: String = try json.decode("Writer")
        writers = writerJson.characters.split(",").map(String.init)

        let genreJson: String = try json.decode("Genre")
        genres = genreJson.characters.split(",").map(String.init)

        if let date = dateFormatter.dateFromString(try json.decode("Released")) {
            released = date
        } else {
            released = NSDate()
        }

        if let metascoreInt = Int(try json.decode("Metascore") as String) {
            metascore = metascoreInt
        } else {
            metascore = 0
        }

        if let rating = Double(try json.decode("imdbRating") as String) {
            imdbRating = rating
        } else {
            imdbRating = 0
        }

        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        if let votes = numberFormatter.numberFromString(try json.decode("imdbVotes") as String) {
            imdbVotes = Int(votes.intValue)
        } else {
            imdbVotes = 0
        }

        response = (try json.string("Response")).lowercaseString == "true"

    }

}

