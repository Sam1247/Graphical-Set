//
//  PlayingCardView.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/5/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
    
    var count    : Count?
    var kind     : Kind?
    var shadding : Shadding?
    var color    : Color?
    
    func setVarients(count: Count, kind: Kind, shadding: Shadding, color: Color) {
        self.count = count
        self.kind = kind
        self.shadding = shadding
        self.color = color
    }
    
    override func draw(_ rect: CGRect) {
        // setting color, shadding
        
        var shapes = [ShapeView]()
        
        for _ in 0..<count!.rawValue {
            let newShape = ShapeView(frame: frame)
            newShape.translatesAutoresizingMaskIntoConstraints = false
            newShape.kind = kind
            newShape.color = color
            newShape.shadding = shadding
            newShape.isOpaque = false
            shapes.append(newShape)
        }
        
        
//        let b1 = ShapeView(frame: frame)
//        b1.translatesAutoresizingMaskIntoConstraints = false
//        b1.kind = .diamond
//        b1.backgroundColor = .white
//        let b2 = ShapeView(frame: frame)
//        b2.translatesAutoresizingMaskIntoConstraints = false
//        b2.kind = .diamond
//        b2.backgroundColor = .white
//        let b3 = ShapeView(frame: frame)
//        b3.translatesAutoresizingMaskIntoConstraints = false
//        b3.kind = .oval
//        b3.backgroundColor = .white
        let stack = UIStackView(arrangedSubviews: shapes)
        stack.translatesAutoresizingMaskIntoConstraints = false


        
        
        
        
//        let b1 = ShapeView(frame: frame)
//        b1.translatesAutoresizingMaskIntoConstraints = false
//        b1.kind = .diamond
//        b1.backgroundColor = .white
//        let b2 = ShapeView(frame: frame)
//        b2.translatesAutoresizingMaskIntoConstraints = false
//        b2.kind = .diamond
//        b2.backgroundColor = .white
//        let b3 = ShapeView(frame: frame)
//        b3.translatesAutoresizingMaskIntoConstraints = false
//        b3.kind = .diamond
//        b3.backgroundColor = .white
//
//        let stack = UIStackView(arrangedSubviews: [b1, b2, b3])
//        stack.translatesAutoresizingMaskIntoConstraints = false
//
//
        stack.axis = .vertical
        stack.spacing = frame.height/16
        stack.distribution = .fillEqually
        addSubview(stack)
        // constrains
        stack.leftAnchor.constraint(equalTo: leftAnchor, constant: frame.width * Constants.marginRatio).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -frame.width * Constants.marginRatio).isActive = true
        stack.heightAnchor.constraint(equalToConstant: frame.height * CGFloat(shapes.count) / 3 - frame.height * Constants.marginRatio).isActive = true
        stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        
    }

}


extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
}
