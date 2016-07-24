//
//  HttpService.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import Foundation
import Moya

public enum HttpServiceRequests {
    case SearchMovieByTitle(title: String)
}

// MARK: - TargetType Protocol Implementation
extension HttpServiceRequests: TargetType {
    public var baseURL: NSURL {
        return NSURL(string: "http://www.omdbapi.com")!
    }

    public var path: String {
        switch self {
        case .SearchMovieByTitle:
            return "/"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .SearchMovieByTitle:
            return .GET
        }
    }

    public var parameters: [String: AnyObject]? {
        var dict = ["r": "json"]
        switch self {
        case .SearchMovieByTitle(let title):
            dict["t"] = title
            return dict
        }
    }

    public var sampleData: NSData {
        switch self {
        case .SearchMovieByTitle(let title):
            return "{\"Title\":\(title),\"Year\":\"1989\",\"Rated\":\"PG-13\",\"Released\":\"23 Jun 1989\",\"Runtime\":\"126 min\",\"Genre\":\"Action, Adventure\",\"Director\":\"Tim Burton\",\"Writer\":\"Bob Kane (Batman characters), Sam Hamm (story), Sam Hamm (screenplay), Warren Skaaren (screenplay)\",\"Actors\":\"Michael Keaton, Jack Nicholson, Kim Basinger, Robert Wuhl\",\"Plot\":\"The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker.\",\"Language\":\"English, French\",\"Country\":\"USA, UK\",\"Awards\":\"Won 1 Oscar. Another 9 wins & 22 nominations.\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg\",\"Metascore\":\"69\",\"imdbRating\":\"7.6\",\"imdbVotes\":\"266,989\",\"imdbID\":\"tt0096895\",\"Type\":\"movie\",\"Response\":\"True\"}".UTF8EncodedData
        }
    }

    public var multipartBody: [MultipartFormData]? { return nil }
}

// MARK: - Helpers
private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
    var UTF8EncodedData: NSData {
        return self.dataUsingEncoding(NSUTF8StringEncoding)!
    }
}