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
    @IBOutlet weak var iconBox: UIView!
    @IBOutlet weak var hoursStudiedContainer: UIView!
    @IBOutlet weak var favCourseContainer: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        profileHeaderContainer.layer.cornerRadius = 8
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        iconBox.layer.cornerRadius = 8
        hoursStudiedContainer.layer.cornerRadius = 8
        favCourseContainer.layer.cornerRadius = 8
    }
    



}
