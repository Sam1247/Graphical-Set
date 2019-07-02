//
//  Card.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/2/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import Foundation

struct Card {
    
    init(number: varient, color: varient, symbol: varient, shading: varient) {
        self.number = number
        self.color = color
        self.symbol = symbol
        self.shading = shading
    }
    
    enum varient: Int {
        case one = 1, two, three
    }
    
    // Indentifiers
    
    let number: varient
    let color: varient
    let symbol: varient
    let shading: varient
    
    
}

extension Card: Equatable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return (
            (lhs.number == rhs.number) &&
                (lhs.color == rhs.color) &&
                (lhs.symbol == rhs.symbol) &&
                (lhs.shading == rhs.shading)
        )
    }
    
}
