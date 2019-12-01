//
//  CustomProgressBar.swift
//  study-quiz
//
//  Created by David Bielenberg on 2019-12-01.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class CustomProgressBar: UIProgressView {
    
    // for programmatically created buttons
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBar()

    }
    
    // init for use in storyboards
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBar()

    }
    
    func setupBar() {
        self.trackTintColor = UIColor(named: "Light-Gray")
        self.progressTintColor = UIColor(named: "Secondary")
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.layer.sublayers![1].cornerRadius = 8
        self.subviews[1].clipsToBounds = true
    }

}
