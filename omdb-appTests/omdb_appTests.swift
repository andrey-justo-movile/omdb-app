//
//  omdb_appTests.swift
//  omdb-appTests
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import XCTest
import Freddy
@testable import omdb_app

class omdb_appTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseMovie() {
        let jsonString = "{\"Title\":\"Batman\",\"Year\":\"1989\",\"Rated\":\"PG-13\",\"Released\":\"23 Jun 1989\",\"Runtime\":\"126 min\",\"Genre\":\"Action, Adventure\",\"Director\":\"Tim Burton\",\"Writer\":\"Bob Kane (Batman characters), Sam Hamm (story), Sam Hamm (screenplay), Warren Skaaren (screenplay)\",\"Actors\":\"Michael Keaton, Jack Nicholson, Kim Basinger, Robert Wuhl\",\"Plot\":\"The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker.\",\"Language\":\"English, French\",\"Country\":\"USA, UK\",\"Awards\":\"Won 1 Oscar. Another 9 wins & 22 nominations.\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg\",\"Metascore\":\"69\",\"imdbRating\":\"7.6\",\"imdbVotes\":\"266,989\",\"imdbID\":\"tt0096895\",\"Type\":\"movie\",\"Response\":\"True\"}"

        let movie: Movie = try! Movie(json: JSON(jsonString: jsonString))

        XCTAssertNotNil(movie, "Movie Cannot be nil")

    }
    
}
