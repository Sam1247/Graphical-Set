//
//  Set.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/2/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import Foundation

struct Set {
    
    private(set) var deck = [Card]()
    var playingCards = [Card?]()
    
    init() {
        for color in 1...3 {
            for kind in 1...3 {
                for count in 1...3 {
                    for shadding in 1...3 {
                        deck.append(
                            Card(
                                color: Card.varient(rawValue: color)!,
                                kind: Card.varient(rawValue: kind)!,
                                count: Card.varient(rawValue: count)!,
                                shadding: Card.varient(rawValue: shadding)!
                            )
                        )
                    }
                }
            }
        }
        deck.shuffle()
    }
    
    mutating func dealMoreCards () {
        for _ in 0..<3 {
            playingCards.append(deck.remove(at: 0))
        }
    }
    
    mutating func shufflePlayingCards() {
        playingCards.shuffle()
    }
    
    mutating func isMatched (_ card1: Card, _ card2: Card, _ card3: Card) -> Bool {
        
        let sameColor = card1.varient2 == card2.varient2 &&
            card2.varient2 == card3.varient2
        let sameNumber = card1.varient1 == card2.varient1 &&
            card2.varient1 == card3.varient1
        let sameSymbol = card1.varient3 == card2.varient3 &&
            card2.varient3 == card3.varient3
        let sameShading = card1.varient4 == card2.varient4 &&
            card2.varient4 == card3.varient4
        
        let differentColor = card1.varient2 != card2.varient2 &&
            card1.varient2 != card3.varient2 &&
            card2.varient2 != card3.varient2
        let differentNumber = card1.varient1 != card2.varient1 &&
            card1.varient1 != card3.varient1 &&
            card2.varient1 != card3.varient1
        let differentSymbol = card1.varient3 != card2.varient3 &&
            card1.varient3 != card3.varient3 &&
            card2.varient3 != card3.varient3
        let differentShading = card1.varient4 != card2.varient4 &&
            card1.varient4 != card3.varient4 &&
            card2.varient4 != card3.varient4
        
        if (sameColor || differentColor) && (sameNumber || differentNumber) && (sameSymbol || differentSymbol) && (sameShading || differentShading){
            let index1 = playingCards.firstIndex(of: card1)!
            playingCards.remove(at: index1)
            let index2 = playingCards.firstIndex(of: card2)!
            playingCards.remove(at: index2)
            let index3 = playingCards.firstIndex(of: card3)!
            playingCards.remove(at: index3)
            return true
        }
        return false
    }
    
}
