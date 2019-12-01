//
//  ProfileViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 18.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileHeaderContainer: UIView!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var iconBox1: UIView!
    @IBOutlet weak var iconBox2: UIView!
    @IBOutlet weak var iconBox3: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconBox1.layer.cornerRadius = 4
        iconBox2.layer.cornerRadius = 4
        iconBox3.layer.cornerRadius = 4

        profileHeaderContainer.layer.cornerRadius = 8
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        
        
        
    }
    



}
