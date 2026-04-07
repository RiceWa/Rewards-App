//
//  HomeViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//
//  Principal Author: James Fitze (Visual Design)
//  Description: This is the main screen of the application
//  It lets users navigate to different main views (points, maps, redeem, barcode)

import UIKit

class HomeViewController: UIViewController {
    
    //outlet for greeting user
    @IBOutlet weak var textFieldGreeting: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .systemBackground
        
        //show the greeting
        textFieldGreeting.text = "Hello, \(CurrentLogin.username)!"
    }
    
    //Principal Author: Daniel Perusse
    //This method lets us navigate to the View Points screen
    @IBAction func btnViewPointsPressed(_ sender: UIButton) {
        
        //Needed for navigation to show screen
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "PointsViewController") as! PointsViewController
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    
    //Principal Author: Daniel Perusse
    //This method lets us navigate to the View Points screen
    @IBAction func btnBrowseRewardsPressed(_ sender: UIButton) {
        
        //Needed for navigation to show screen
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "RewardsListViewController") as! RewardsListViewController
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    
    //Principal Author: Daniel Perusse
    //This method lets us navigate to the View Points screen
    @IBAction func btnShowBarcodePressed(_ sender: UIButton) {
        
        //Needed for navigation to show screen
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "BarcodeViewController") as! BarcodeViewController
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    
    //Principal Author: Daniel Perusse
    //This method lets us navigate to the View Points screen
    @IBAction func btnStoreLocationsPressed(_ sender: UIButton) {
        
        //Needed for navigation to show screen
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreLocationsViewController") as! StoreLocationsViewController
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    
}
