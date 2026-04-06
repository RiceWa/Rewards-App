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
            Store(name: "Store A", address: "404 Georgian Found", latitude: 44.3894, longitude: -79.6903, hours: "9am - 9pm"),
            Store(name: "Store B", address: "420 Maple Ave", latitude: 44.4000, longitude: -79.6800, hours: "10am - 10pm")
        ]
    }
}
