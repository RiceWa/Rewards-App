//
//  HomeViewController.swift
//  RewardsApp
//
//  Created by James Fitze on 2026-04-06.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .systemBackground
    }
    
    //navigation for the main screens using navigation controller and pushing VC's
    @IBAction func btnViewPointsPressed(_ sender: UIButton) {
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "PointsViewController") as! PointsViewController
        
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    @IBAction func btnBrowseRewardsPressed(_ sender: UIButton) {
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "RewardsListViewController") as! RewardsListViewController
        
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    @IBAction func btnShowBarcodePressed(_ sender: UIButton) {
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "BarcodeViewController") as! BarcodeViewController
        
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    @IBAction func btnStoreLocationsPressed(_ sender: UIButton) {
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreLocationsViewController") as! StoreLocationsViewController
        
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    
}
