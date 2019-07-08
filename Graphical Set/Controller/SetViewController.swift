//
//  ViewController.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/2/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {
    
    @IBOutlet weak var containerView: ContainerView!
    
    @IBOutlet weak var dealButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dealButton.layer.cornerRadius = 12
    }

    
    @IBAction func deal(_ sender: UIButton) {
        containerView.playingCardsCounts += 3
    }
    
}

