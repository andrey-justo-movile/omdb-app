//
//  DatabaseProviderTestsIntance.swift
//  omdb-app
//
//  Created by Andrey Justo on 7/24/16.
//  Copyright © 2016 Andrey Justo. All rights reserved.
//

@testable import omdb_app
import Foundation
import RealmSwift

public class DatabaseProviderTestsIntance: DatabaseInstance {

    public static let instance: DatabaseProviderTestsIntance = DatabaseProviderTestsIntance()

    public var currentRealm: Realm? {
        var inicialRealm: Realm?
        do {
            try inicialRealm = Realm(configuration: Realm.Configuration(inMemoryIdentifier: "memoryObjects"))
        } catch _ {
            NSLog("Couldnt get the default REALM", [])
        }

        return inicialRealm
    }

    public static func insertAllObjects(array: Array<Object>) {
        do {
            try DatabaseProviderTestsIntance.instance.currentRealm!.write({ () -> Void in
                DatabaseProviderTestsIntance.instance.currentRealm!.add(array, update: true)
            })
        } catch _ {
            NSLog("Couldnt insert values in the REALM", [])
        }
    }

    public static func fechtAllMoviesOrderedByTitle() -> Results<MovieDB>? {
        return DatabaseProvider.instance.currentRealm?.objects(MovieDB).sorted("title", ascending: true)
    }
}