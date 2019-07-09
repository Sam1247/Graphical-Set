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
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
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
        
        let stack = UIStackView(arrangedSubviews: shapes)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
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
