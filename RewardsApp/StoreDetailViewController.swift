//
//  StoreDetailViewController.swift
//  RewardsApp
//
//  Created by Daniel Perusse on 2026-04-06.
//
//  Principal Author: Daniel Perusse
//  Description: Displays the selected store's details
import UIKit

class StoreDetailViewController: UIViewController {
    
    //Outlets to display details + image
    @IBOutlet weak var imageViewStore: UIImageView!
    
    @IBOutlet weak var labelAddress: UILabel!
    
    @IBOutlet weak var labelHours: UILabel!
    
    //hold store info
    var store: Store?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //to show store name in nav title
        title = store?.name
        
        //sets outlet to store data for viewing
        labelAddress.text = store!.address
        labelHours.text = store!.hours
        
        //set the image of the store
        imageViewStore.image = UIImage(named: store!.name + ".png")
    }
}
