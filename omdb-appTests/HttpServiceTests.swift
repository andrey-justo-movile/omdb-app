//
//  HttpServiceTests.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

@testable import omdb_app
import XCTest
import Foundation
import Nimble
import Quick

class HttpServiceTests: QuickSpec {
    override func spec() {
        it("checks if we can parse movie calling imdb") {
            let httpService = HttpService()
            var currentMovie: Movie?
            waitUntil { done in
                httpService.searchMoviesByTitle("batman", success: { movie in
                    currentMovie = movie
                    done()
                    })
                { error in
                    fail("\(error)")
                }
            }

            expect(currentMovie).toNot(beNil())
        }
    }
}