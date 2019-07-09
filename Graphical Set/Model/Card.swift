//
//  Card.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/2/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import Foundation

struct Card {
    
    init(color: varient, kind: varient, count: varient, shadding: varient) {
        self.varient1 = color
        self.varient2 = kind
        self.varient3 = count
        self.varient4 = shadding
    }
    
    enum varient: Int {
        case one = 1, two, three
    }
    
    // Indentifiers
    
    let varient1: varient
    let varient2: varient
    let varient3: varient
    let varient4: varient
    
    
}

extension Card: Equatable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return (
            (lhs.varient1 == rhs.varient1) &&
                (lhs.varient2 == rhs.varient2) &&
                (lhs.varient3 == rhs.varient3) &&
                (lhs.varient4 == rhs.varient4)
        )
    }
    
}
