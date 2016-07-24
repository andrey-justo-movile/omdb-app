//
//  DatabaseProvider.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/23/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

import Foundation
import RealmSwift

protocol DatabaseInstance {
    var currentRealm: Realm? { get }
}

public class DatabaseProvider: DatabaseInstance {

    public static let instance: DatabaseProvider = DatabaseProvider()

    public var currentRealm: Realm? {
        var inicialRealm: Realm?
        do {
            try inicialRealm = Realm()
        } catch _ {
            NSLog("Couldnt get the default REALM", [])
        }

        return inicialRealm
    }

    public static func insertAllObjects(array: Array<Object>) {
        do {
            try DatabaseProvider.instance.currentRealm!.write({ () -> Void in
                DatabaseProvider.instance.currentRealm!.add(array, update: true)
            })
        } catch _ {
            NSLog("Couldnt insert values in the REALM", [])
        }
    }

    public static func fechtAllMoviesOrderedByTitle() -> Results<MovieDB>? {
        return DatabaseProvider.instance.currentRealm?.objects(MovieDB).sorted("title", ascending: true)
    }

}