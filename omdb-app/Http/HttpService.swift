//
//  HttpService.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import Foundation
import Moya
import Freddy

public class HttpService {
    let provider = MoyaProvider<HttpServiceRequests>()

    public init() {}

    public func searchMoviesByTitle(title: String, success: (Movie -> Void), errorBlock : ((Error) -> Void)) {
        provider.request(.SearchMovieByTitle(title: title)) { result in
            switch (result) {
            case let .Success(moyaResponse):
                let json = try! JSON(data: moyaResponse.data)
                success(try! Movie(json: json))
            case let .Failure(error):
                errorBlock(error)
            }

        }
    }
}
