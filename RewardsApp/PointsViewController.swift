//
//  PointsViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//

import UIKit

class PointsViewController: UIViewController {

    @IBOutlet weak var pointsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        
        title = "Your Points"
        //view.backgroundColor = .systemBackground
    }

    func updateLabel() {
        pointsLabel.text = "\(PointsManager.getPoints()) Points"
    }

    @IBAction func addPointsTapped(_ sender: UIButton) {
        PointsManager.addPoints(50)
        updateLabel()
    }
}
