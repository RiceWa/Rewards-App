//
//  StoreRepository.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//

import Foundation

class StoreRepository {

    static func getStores() -> [Store] {
        return [
            Store(name: "Store A", address: "85 dunlop street west", latitude: 44.3878, longitude: -79.69279, hours: "11am - 11pm"),
            Store(name: "Store B", address: "446 Bayfield Street", latitude: 44.40988, longitude: -79.7088, hours: "8am - 10pm"),
            Store(name: "Store C", address: "347 Yonge Street", latitude: 44.36925, longitude: -79.66647, hours: "6am - 11pm")
        ]
    }
}
