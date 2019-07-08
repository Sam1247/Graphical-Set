//
//  ViewController.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/2/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {
    
    var game = Set()
    
    @IBOutlet weak var containerView: ContainerView!
    
    @IBOutlet weak var dealButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dealButton.layer.cornerRadius = 12
        initialSetup()
    }
    
    func initialSetup() {
        for _ in 0..<4 {
            game.dealMoreCards()
        }
        updateViewFromModel()
    }

    func updateViewFromModel () {
        containerView.playingCardViews.removeAll()
        for card in game.playingCards {
            let cardView = PlayingCardView()
            cardView.backgroundColor = .white
            cardView.clipsToBounds = true
            cardView.layer.borderWidth = 1
            cardView.layer.borderColor = UIColor.gray.cgColor
            cardView.layer.cornerRadius = 1
            cardView.color = Color(rawValue: card!.varient1.rawValue)
            cardView.kind = Kind(rawValue: card!.varient2.rawValue)
            cardView.count = Count(rawValue: card!.varient3.rawValue)
            cardView.shadding = Shadding(rawValue: card!.varient4.rawValue)
            containerView.playingCardViews.append(cardView)
        }
    }
    
    @IBAction func deal(_ sender: UIButton) {
        game.dealMoreCards()
        updateViewFromModel()
    }
    
}

