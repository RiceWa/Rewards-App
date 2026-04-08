//
//  RedeemViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//
//  Principal Author: James Fitze
//  Description: Shows a reward and lets you redeem it.

import UIKit
import CoreData

// Redeem screen
class RedeemViewController: UIViewController {

    // UI outlets
    @IBOutlet weak var rewardNameLabel: UILabel!
    
    @IBOutlet weak var rewardCostLabel: UILabel!
    
    @IBOutlet weak var rewardPointsLabel: UILabel!
    
    @IBOutlet weak var rewardDescriptionLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

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
                rewardPointsLabel.text = "Your Points: \(user.points) Points"
            }
        } catch {
            rewardPointsLabel.text = "N\\A Points"
        }
    }

    // Fill labels
    func loadReward() {
        // Need a reward
        guard let reward = reward else { return }

        rewardNameLabel.text = reward.name
        rewardCostLabel.text = "Cost: \(reward.pointsCost) points"
        rewardDescriptionLabel.text = reward.description
    }

    // Redeem button
    @IBAction func redeemTapped(_ sender: UIButton) {
        // Need a reward
        guard let reward = reward else { return }

        // Try to spend points DEPRECATED
        //let success = PointsManager.redeemPoints(reward.pointsCost)
        
        // Make message
        var message = ""
        
        //fetch the users points
        let request: NSFetchRequest<Users> = Users.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@", CurrentLogin.username)
        request.fetchLimit = 1
        
        //update the users points and show the new value
        do {
            let user = try context.fetch(request)
            
            if let userToUpdate = user.first {
                
                //show error if not enough
                if userToUpdate.points - Int32(reward.pointsCost) < 0 {
                    message = "Not enough points."
                } else {
                    //update and show change
                    userToUpdate.points -= Int32(reward.pointsCost)
                    try context.save()
                    rewardPointsLabel.text = "Your Points: \(userToUpdate.points) Points"
                    message = "You redeemed \(reward.name)."
                }
            }
        } catch {
            rewardPointsLabel.text = "N\\A Points"
            message = "Error redeeming reward."
        }

        // Show result
        let alert = UIAlertController(title: "Redeem Reward", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

