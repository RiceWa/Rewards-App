//
//  RewardsListViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//

// Shows a list of rewards

import UIKit

// Rewards list screen
class RewardsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // UI outlet
    @IBOutlet weak var tableView: UITableView!

    // Data source
    var rewards: [Reward] = []

    // Setup on load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Basic UI + load data
        title = "Rewards"
        //view.backgroundColor = .systemBackground

        // Fetch rewards
        rewards = RewardRepository.getRewards()

        // Hook up table
        tableView.dataSource = self
        tableView.delegate = self
    }

    // Row count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewards.count
    }

    // Configure cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Model for this row
        let reward = rewards[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RewardCell", for: indexPath)

        // Set name + points
        var content = cell.defaultContentConfiguration()
        content.text = reward.name
        content.secondaryText = "\(reward.pointsCost) points"
        cell.contentConfiguration = content

        return cell
    }

    // Handle selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Selected model
        let selectedReward = rewards[indexPath.row]
        // Go to redeem
        performSegue(withIdentifier: "goToRedeem", sender: selectedReward)
    }

    // Pass data to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRedeem" {
            // Set selected reward on destination
            if let destination = segue.destination as? RedeemViewController,
               let selectedReward = sender as? Reward {
                destination.reward = selectedReward
            }
        }
    }
}

