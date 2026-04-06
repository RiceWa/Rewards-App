//
//  PointsManager.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//
//  Principal Author: James Fitze
//  Description: Basic mockup to simulate earning points from purchases

import Foundation

//class for managing users points
class PointsManager {

    //used to set a baseline starting points for user
    static var points: Int = 1000

    //for showing user how many points
    static func getPoints() -> Int {
        return points
    }

    //for adding to the users point total
    static func addPoints(_ amount: Int) {
        points += amount
    }

    //for removing points during item redeeming
    static func redeemPoints(_ amount: Int) -> Bool {
        if points >= amount {
            points -= amount
            return true
        }
        return false
    }
}
