//
//  RewardRepository.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//

import Foundation

class RewardRepository {

    static func getRewards() -> [Reward] {
        return [
            Reward(id: 1, name: "Free Coffee", pointsCost: 100, description: "Get a free coffee"),
            Reward(id: 2, name: "Free Burger", pointsCost: 500, description: "Get a free burger"),
            Reward(id: 3, name: "Free Meal", pointsCost: 1000, description: "Full meal reward")
        ]
    }
}
