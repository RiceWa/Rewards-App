//
//  PointsViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//
//  Principal Author: James Fitze
//  Description: View Controller for the points screen. Shows users total points
import UIKit
import CoreData


class PointsViewController: UIViewController {

    //lets us interact with coredata
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        
        //sets view title at top of screen
        title = "Your Points"
        //view.backgroundColor = .systemBackground
    }

    //needed to show how many points when updated
    func updateLabel() {
        
        //DEPRECATED
        //pointsLabel.text = "\(PointsManager.getPoints()) Points"
        
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
    
    //update the users points in coredata
    func addPoints() {
        let request: NSFetchRequest<Users> = Users.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@", CurrentLogin.username)
        request.fetchLimit = 1
        
        //update the users points and show the new value
        do {
            let user = try context.fetch(request)
            
            if let userToUpdate = user.first {
                userToUpdate.points += 50
                try context.save()
                pointsLabel.text = "\(userToUpdate.points) Points"
            }
        } catch {
            pointsLabel.text = "N\\A Points"
        }
    }

    //simulates earning points
    @IBAction func addPointsTapped(_ sender: UIButton) {
        //adds to the point total and refreshes point total display
        addPoints()
    }
}
