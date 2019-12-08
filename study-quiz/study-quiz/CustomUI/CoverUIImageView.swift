//
//  coverUIImageView.swift
//  study-quiz
//
//  Created by David Bielenberg on 2019-12-01.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class CoverUIImageView: UIImageView {

    // for programmatically created buttons
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // init for use in storyboards
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // Style the button
    func setupView() {
        layer.cornerRadius = 8

    }

}
