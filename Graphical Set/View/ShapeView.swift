//
//  Shape.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/6/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    
    var shadding : Shadding?
    var color    : Color?
    var kind     : Kind?
    
    override func draw(_ rect: CGRect) {
        let path: UIBezierPath
        switch kind! {
        case .diamond:
            path = UIBezierPath()
            let beginingPoint = bounds.origin.offsetBy(dx: 0, dy: (bounds.height/2))
            path.move(to: beginingPoint)
            path.addLine(to: beginingPoint.offsetBy(dx: bounds.width/2, dy: -(bounds.height/2)))
            path.addLine(to: beginingPoint.offsetBy(dx: bounds.width, dy: 0))
            path.addLine(to: beginingPoint.offsetBy(dx: bounds.width/2, dy: (bounds.height/2)))
            path.close()
        case .oval:
            path = UIBezierPath(ovalIn: bounds)
        case .triangle:
            path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: bounds.height - bounds.height * Constants.marginRatio))
            path.addLine(to: CGPoint(x: bounds.width/2, y: 0))
            path.addLine(to: CGPoint(x: bounds.width, y: bounds.height - bounds.height * Constants.marginRatio))
            path.close()
        }
        
        switch color! {
        case .green:
            UIColor.green.setFill()
            UIColor.green.setStroke()
        case .purple:
            UIColor.purple.setFill()
            UIColor.purple.setStroke()
        case .red:
            UIColor.red.setFill()
            UIColor.red.setStroke()
        }
        
        switch shadding! {
        case .open:
            path.stroke()
        case .shaded:
            path.fill()
            alpha = 0.3
        case .solid:
            path.fill()
        }
        
        path.lineWidth = 1
        path.addClip()
    }

}

struct Constants {
    static let marginRatio: CGFloat = 0.0625
    static let strokeRatio: CGFloat = 0.01
    static let cornerRadiusRatio: CGFloat = 0.25
}
