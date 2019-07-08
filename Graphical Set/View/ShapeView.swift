//
//  Shape.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/6/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    
    var shadding: CGFloat?
    
    var color: Color?
    
    var kind: Kind?
    
    override func draw(_ rect: CGRect) {
        switch kind! {
        case .diamond:
            let path = UIBezierPath()
            let beginingPoint = bounds.origin.offsetBy(dx: 0, dy: (bounds.height/2))
            path.move(to: beginingPoint)
            path.addLine(to: beginingPoint.offsetBy(dx: bounds.width/2, dy: -(bounds.height/2)))
            path.addLine(to: beginingPoint.offsetBy(dx: bounds.width, dy: 0))
            path.addLine(to: beginingPoint.offsetBy(dx: bounds.width/2, dy: (bounds.height/2)))
            path.close()
            UIColor.green.setFill()
            UIColor.blue.setStroke()
            path.lineWidth = 32
            path.addClip()
            path.fill()
            path.stroke()
        case .oval:
            let path = UIBezierPath(ovalIn: bounds)
            //UIColor.green.setFill()
            UIColor.blue.setStroke()
            path.lineWidth = 12
            path.addClip()
            //path.fill()
            path.stroke()
        case .triangle:
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: bounds.height))
            path.addLine(to: CGPoint(x: bounds.width/2, y: 0))
            path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
            path.close()
            //UIColor.green.setFill()
            UIColor.blue.setStroke()
            path.lineWidth = 1
            //path.fill()
            path.stroke()
        }
    }

}

struct Constants {
    static let strokeWidth: CGFloat = 3.0
    static let margin: CGFloat = 16.0
    static let marginRatio: CGFloat = 0.0625
}
