//
//  Country.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import Foundation
import RealmSwift

public class Country: Object {
    dynamic var name = ""

    override public class func primaryKey() -> String? {
        return "name"
    }
}