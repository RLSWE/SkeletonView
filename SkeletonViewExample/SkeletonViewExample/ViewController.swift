//
//  ViewController.swift
//  SkeletonViewExample
//
//  Created by Roni Leshes on 3/16/18.
//  Copyright © 2018 Roni Leshes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var skeletonView: SkeletonView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    
    @IBOutlet var maskingViews: [UIView]!
    
    @IBOutlet weak var profileImageViewPlaceholder: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    

    //====================================
    //MARK: VC Lifecycle
    //====================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLabels()
        self.setupCardView()
        self.setupProfileImageView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.skeletonView.setMaskingViews(self.maskingViews)
    }
    
    
    //====================================
    //MARK: Setup UI
    //====================================
    func setupLabels(){
        self.nameLabel.alpha = 0.0
        self.jobTitleLabel.alpha = 0.0
        self.locationLabel.alpha = 0.0
    }
    func setupCardView(){
        self.cardView.layer.cornerRadius = 14.0
        self.cardView.layer.shadowColor = UIColor.darkGray.cgColor
        self.cardView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.cardView.layer.shadowRadius = 6.0
        self.cardView.layer.shadowOpacity = 0.6
        
    }
    func setupProfileImageView(){
        self.profileImageView.layer.masksToBounds = true
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height / 2
        
        self.profileImageViewPlaceholder.layer.masksToBounds = true
        self.profileImageViewPlaceholder.layer.cornerRadius = self.profileImageViewPlaceholder.frame.size.height / 2
    }
    
    
    
    //====================================
    //MARK: Actions
    //====================================
    @IBAction func loadProfilePressed(_ sender: Any) {
        
        //Start animating skeleton view
        self.skeletonView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            //Set text to labels
            self.nameLabel.text = "Roni Leshes"
            self.jobTitleLabel.text = "iOS Developer"
            self.locationLabel.text = "Tel Aviv"
            
            //Stop animating skeleton view
            self.skeletonView.stopAnimating()
            
            //Remove skeleton view's mask
            self.skeletonView.layer.mask = nil
            
            //Animate content fade in
            UIView.animate(withDuration: 0.3, animations: {
                self.nameLabel.alpha = 1.0
                self.jobTitleLabel.alpha = 1.0
                self.locationLabel.alpha = 1.0
                self.profileImageView.image = #imageLiteral(resourceName: "Roni")
            })
        }
    }
}

