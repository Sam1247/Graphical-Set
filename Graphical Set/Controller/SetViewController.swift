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
    var selectedPlayingCards = [PlayingCardView]() {
        didSet {
            if selectedPlayingCards.count == 3 {
                handleMatching()
            }
        }
    }
    
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
            cardView.color = Color(rawValue: card!.varient1.rawValue)
            cardView.kind = Kind(rawValue: card!.varient2.rawValue)
            cardView.count = Count(rawValue: card!.varient3.rawValue)
            cardView.shadding = Shadding(rawValue: card!.varient4.rawValue)
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SetViewController.select(recognizer:)))
            cardView.addGestureRecognizer(tapGestureRecognizer)
            containerView.playingCardViews.append(cardView)
        }
    }
    
    @IBAction func deal(_ sender: UIButton) {
        if game.deck.count == 0 {
            dealButton.isEnabled = false
            return
        }
        game.dealMoreCards()
        updateViewFromModel()
    }
    
    @objc
    func select(recognizer: UIPanGestureRecognizer) {
        if let sender = recognizer.view as? PlayingCardView {
            if selectedPlayingCards.contains(sender) {
                sender.layer.borderColor = UIColor.gray.cgColor
                selectedPlayingCards.remove(at: selectedPlayingCards.firstIndex(of: sender)!)
                return
            }
            sender.layer.borderColor = UIColor.blue.cgColor
            selectedPlayingCards.append(sender)
        }
    }
    
    func handleMatching() {
        
    }
}
