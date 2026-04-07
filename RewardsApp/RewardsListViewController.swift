//
//  RewardsListViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//
//  Principal Author: James Fitze
//  Description:  Shows a list of rewards

import UIKit
import CoreData

// Rewards list screen
class RewardsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // UI outlet
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var pointsLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
        
        updateLabel()
    }
    
    //update points when view pops up
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel()
    }
    
    //needed to show how many points when updated
    func updateLabel() {
        
        //build our request to fetch user points
        let request: NSFetchRequest<Users> = Users.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@", CurrentLogin.username)
        //limit to only 1 user
        request.fetchLimit = 1
        
        //show the user how many points they have
        do {
            let users = try context.fetch(request)
            
            if let user = users.first {
                pointsLabel.text = "\(user.points) Points"
            }
        } catch {
            pointsLabel.text = "N\\A Points"
        }
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

