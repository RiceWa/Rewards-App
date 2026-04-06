//
//  PointsManager.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//

import Foundation

class PointsManager {

    static var points: Int = 1000

    static func getPoints() -> Int {
        return points
    }

    static func addPoints(_ amount: Int) {
        points += amount
    }

    static func redeemPoints(_ amount: Int) -> Bool {
        if points >= amount {
            points -= amount
            return true
        }
        return false
    }
}
