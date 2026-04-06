//
//  PointsViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//
//  Principal Author: James Fitze
//  Description: View Controller for the points screen. Shows users total points
import UIKit


class PointsViewController: UIViewController {

    
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
        pointsLabel.text = "\(PointsManager.getPoints()) Points"
    }

    //simulates earning points
    @IBAction func addPointsTapped(_ sender: UIButton) {
        //adds to the point total and refreshes point total display
        PointsManager.addPoints(50)
        updateLabel()
    }
}
