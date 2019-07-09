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
    @IBOutlet weak var containerView: ContainerView! {
        didSet {
            let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(shuffle(recognizer:)))
            containerView.addGestureRecognizer(rotationGesture)
            let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(dealSwipe(recognizer:)))
            swipeDownGesture.direction = .down
            containerView.addGestureRecognizer(swipeDownGesture)
        }
    }
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

    @objc
    func updateViewFromModel() {
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
        deal3more()
    }
    
    func deal3more() {
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
        let card1 = getCardFromView(from: selectedPlayingCards[0])
        let card2 = getCardFromView(from: selectedPlayingCards[1])
        let card3 = getCardFromView(from: selectedPlayingCards[2])
        if game.isMatched(card1, card2, card3) {
            for cardView in containerView.playingCardViews {
                if selectedPlayingCards.contains(cardView) {
                    cardView.layer.borderColor = UIColor.cyan.cgColor
                }
            }
            selectedPlayingCards.removeAll()
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateViewFromModel), userInfo: nil, repeats: false)
        }
    }
    
    func getCardFromView(from cardView: PlayingCardView) -> Card {
        let card = Card(
            color: Card.varient(rawValue: cardView.color!.rawValue)!,
            kind: Card.varient(rawValue: cardView.kind!.rawValue)!,
            count: Card.varient(rawValue: cardView.count!.rawValue)!,
            shadding: Card.varient(rawValue: cardView.shadding!.rawValue)!
        )
        return card
    }
    
    @objc
    func shuffle(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            game.shufflePlayingCards()
            updateViewFromModel()
        default:
            break
        }
    }
    
    @objc
    func dealSwipe(recognizer: UISwipeGestureRecognizer) {
        print("hereee")
        switch recognizer.direction {
        case .down:
            deal3more()
        default:
            break
        }
    }
    
}
