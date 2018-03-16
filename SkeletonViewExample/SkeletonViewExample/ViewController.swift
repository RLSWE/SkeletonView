//
//  ViewController.swift
//  SkeletonViewExample
//
//  Created by Roni Leshes on 3/16/18.
//  Copyright © 2018 Roni Leshes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet var skeletonViews: [SkeletonView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.alpha = 0.0
        self.jobTitleLabel.alpha = 0.0
        self.locationLabel.alpha = 0.0
    }

    @IBAction func loadProfilePressed(_ sender: Any) {
        
        //Start animating skeleton views
        self.skeletonViews.forEach{ $0.startAnimating() }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            //Set text to labels
            self.nameLabel.text = "Roni Leshes"
            self.jobTitleLabel.text = "iOS Developer"
            self.locationLabel.text = "Tel Aviv"
            
            //Stop animating skeleton views
            self.skeletonViews.forEach { $0.stopAnimating() }
            
            UIView.animate(withDuration: 0.3, animations: {
                //Fade out loaders
                self.skeletonViews.forEach { $0.alpha = 0.0 }
                
            }, completion: { (completed) in
                if completed{
                    //Animate content fade 
                    UIView.animate(withDuration: 0.3, animations: {
                        self.nameLabel.alpha = 1.0
                        self.jobTitleLabel.alpha = 1.0
                        self.locationLabel.alpha = 1.0
                        self.imageView.image = #imageLiteral(resourceName: "Roni")
                    })
                }
            })
        }
    }
}

