//
//  StartViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 07.12.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Load in data from JSON-File
        AppData.loadJSON()

    }
    

}
