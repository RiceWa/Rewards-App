//
//  StoreDetailViewController.swift
//  RewardsApp
//
//  Created by Daniel Perusse on 2026-04-06.
//

import UIKit

class StoreDetailViewController: UIViewController {
    
    @IBOutlet weak var imageViewStore: UIImageView!
    
    @IBOutlet weak var labelAddress: UILabel!
    
    @IBOutlet weak var labelHours: UILabel!
    
    //hold the store in question
    var store: Store?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = store?.name
        
        labelAddress.text = store!.address
        
        labelHours.text = store!.hours
        
        //set the image of the store
        imageViewStore.image = UIImage(named: store!.name + ".png")
    }
}
