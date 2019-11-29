//
//  CustomButton.swift
//  study-quiz
//
//  Created by David Bielenberg on 2019-11-29.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    // for programmatically created buttons
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    // init for use in storyboards
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // Style the button
    func setupButton() {
        layer.cornerRadius = 8
    }

}
