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
        for number in 1...3 {
            for color in 1...3 {
                for symbol in 1...3 {
                    for shading in 1...3 {
                        deck.append(
                            Card(
                                number: Card.varient(rawValue: number)!,
                                color: Card.varient(rawValue: color)!,
                                symbol: Card.varient(rawValue: symbol)!,
                                shading: Card.varient(rawValue: shading)!
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
    
    mutating func isMatched (_ index1: Int, _ index2: Int, _ index3: Int) -> Bool {
        
        let sameColor = playingCards[index1]!.varient2 == playingCards[index2]!.varient2 &&
            playingCards[index2]!.varient2 == playingCards[index3]!.varient2
        let sameNumber = playingCards[index1]!.varient1 == playingCards[index2]!.varient1 &&
            playingCards[index2]!.varient1 == playingCards[index3]!.varient1
        let sameSymbol = playingCards[index1]!.varient3 == playingCards[index2]!.varient3 &&
            playingCards[index2]!.varient3 == playingCards[index3]!.varient3
        let sameShading = playingCards[index1]!.varient4 == playingCards[index2]!.varient4 &&
            playingCards[index2]!.varient4 == playingCards[index3]!.varient4
        
        let differentColor = playingCards[index1]!.varient2 != playingCards[index2]!.varient2 &&
            playingCards[index1]!.varient2 != playingCards[index3]!.varient2 &&
            playingCards[index2]!.varient2 != playingCards[index3]!.varient2
        let differentNumber = playingCards[index1]!.varient1 != playingCards[index2]!.varient1 &&
            playingCards[index1]!.varient1 != playingCards[index3]!.varient1 &&
            playingCards[index2]!.varient1 != playingCards[index3]!.varient1
        let differentSymbol = playingCards[index1]!.varient3 != playingCards[index2]!.varient3 &&
            playingCards[index1]!.varient3 != playingCards[index3]!.varient3 &&
            playingCards[index2]!.varient3 != playingCards[index3]!.varient3
        let differentShading = playingCards[index1]!.varient4 != playingCards[index2]!.varient4 &&
            playingCards[index1]!.varient4 != playingCards[index3]!.varient4 &&
            playingCards[index2]!.varient4 != playingCards[index3]!.varient4
        
        if (sameColor || differentColor) && (sameNumber || differentNumber) && (sameSymbol || differentSymbol) && (sameShading || differentShading){
            playingCards[index1] = nil
            playingCards[index2] = nil
            playingCards[index3] = nil
            return true
        }
        return false
    }
    
}
