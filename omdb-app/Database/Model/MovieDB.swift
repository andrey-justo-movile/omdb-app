//
//  MovieDB.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import Foundation
import RealmSwift

protocol TransformToDB {
    associatedtype T = Object
    func transform() -> T
}

public class MovieDB: Object {

    dynamic var title = ""
    dynamic var year = ""
    dynamic var rated = ""
    dynamic var released = NSDate()
    dynamic var runtime = ""
    dynamic var plot = ""
    dynamic var awards = ""
    dynamic var poster = ""
    dynamic var metascore = 0
    dynamic var imdbRating = 0.0
    dynamic var imdbVotes = 0
    dynamic var imdbID = ""
    dynamic var type = ""
    dynamic var response = true
    dynamic var director = ""
    let genres = List<Genre>()
    let writers = List<Writer>()
    let actors = List<Actor>()
    let languages = List<Language>()
    let countries = List<Country>()

    override public class func primaryKey() -> String? {
        return "imdbID"
    }

}

//MARK: TransformToDB transform model into database model

extension Movie: TransformToDB {
    func transform() -> MovieDB {
        let movieDB = MovieDB()
        movieDB.imdbID = self.imdbID
        movieDB.awards = self.awards
        movieDB.director = self.director
        movieDB.imdbRating = self.imdbRating
        movieDB.imdbVotes = self.imdbVotes
        movieDB.runtime = self.runtime
        movieDB.metascore = self.metascore
        movieDB.plot = self.plot
        movieDB.poster = self.poster
        movieDB.rated = self.rated
        movieDB.released = self.released
        movieDB.response = self.response
        movieDB.year = self.year
        movieDB.title = self.title
        movieDB.type = self.type

        self.actors.forEach({ actorName in
            let a = Actor()
            a.name = actorName
            movieDB.actors.append(a)
        })

        self.countries.forEach({ countryName in
            let c = Country()
            c.name = countryName
            movieDB.countries.append(c)
        })

        self.genres.forEach({ genreName in
            let g = Genre()
            g.name = genreName
            movieDB.genres.append(g)
        })

        self.writers.forEach({ writerName in
            let w = Writer()
            w.name = writerName
            movieDB.writers.append(w)
        })

        self.languages.forEach({ languageName in
            let l = Language()
            l.lang = languageName
            movieDB.languages.append(l)
        })

        return movieDB
    }
}