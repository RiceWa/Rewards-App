//
//  RewardRepository.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//
//  Principal Author: James Fitze
//  Description: Holds reward item data
import Foundation

class RewardRepository {

    //For retrieving reward items
    static func getRewards() -> [Reward] {
        return [
            Reward(id: 1, name: "Free Coffee", pointsCost: 100, description: "Get a free coffee"),
            Reward(id: 2, name: "Free Burger", pointsCost: 500, description: "Get a free burger"),
            Reward(id: 3, name: "Free Meal", pointsCost: 1000, description: "Get a free meal"),
            Reward(id: 4, name: "Free Breakfast", pointsCost: 400, description: "Get a free breakfast"),
            Reward(id: 5, name: "Free Dessert", pointsCost: 300, description: "Get a free dessert")
        ]
    }
}
