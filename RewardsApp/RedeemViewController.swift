//
//  RedeemViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//

// Shows a reward and lets you redeem it.

import UIKit

// Redeem screen
class RedeemViewController: UIViewController {

    // UI outlets
    @IBOutlet weak var rewardNameLabel: UILabel!
    
    @IBOutlet weak var rewardCostLabel: UILabel!
    
    @IBOutlet weak var rewardDescriptionLabel: UILabel!

    // Current reward
    var reward: Reward?

    // Setup on load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Basic UI + load data
        //title = "Redeem"
        //view.backgroundColor = .systemBackground
        loadReward()
    }

    // Fill labels
    func loadReward() {
        // Need a reward
        guard let reward = reward else { return }

        rewardNameLabel.text = reward.name
        rewardCostLabel.text = "\(reward.pointsCost) points"
        rewardDescriptionLabel.text = reward.description
    }

    // Redeem button
    @IBAction func redeemTapped(_ sender: UIButton) {
        // Need a reward
        guard let reward = reward else { return }

        // Try to spend points
        let success = PointsManager.redeemPoints(reward.pointsCost)

        // Make message
        let message: String
        if success {
            message = "You redeemed \(reward.name)."
        } else {
            message = "Not enough points."
        }

        // Show result
        let alert = UIAlertController(title: "Redeem Reward", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

