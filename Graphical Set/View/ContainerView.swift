//
//  ContainerView.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/5/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class ContainerView: UIView {
    
    var playingCardViews = [PlayingCardView]() {
        didSet {
            if playingCardViews.count > columnNumber * columnNumber {
                columnNumber += 1
            } else {
                setNeedsDisplay()
            }
        }
    }
    
    var columnNumber = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        self.subviews.forEach{ $0.removeFromSuperview() }
        let grid = Grid(layout: .dimensions(rowCount: columnNumber, columnCount: columnNumber), frame: self.bounds)
        for i in 0..<columnNumber {
            for j in 0..<columnNumber {
                let index = j + i * columnNumber
                if index < playingCardViews.count {
                    let frame = grid[i, j]
                    let view = playingCardViews[index]
                    view.frame = frame!
                    addSubview(view)
                }
            }
        }
        
    }
    
    private func getRandomColor() -> UIColor {
        let colors = [UIColor.red, .gray, .blue, .black, .darkGray, .cyan, .brown, .green, .orange, .magenta]
        return colors[Int.random(in: 0..<colors.count)]
    }

}
