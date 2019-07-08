//
//  ContainerView.swift
//  Graphical Set
//
//  Created by Abdalla Elsaman on 7/5/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class ContainerView: UIView {
    
    var playingCardViews = [PlayingCardView]()

    var playingCardsCounts = 1 {
        didSet {
            if (playingCardsCounts > columnNumber * columnNumber) {
                columnNumber += 1
            } else {
                setNeedsDisplay()
            }
        }
    }
    
    var columnNumber = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var grid: Grid?
    
    override func draw(_ rect: CGRect) {
        self.subviews.forEach{ $0.removeFromSuperview() }
        grid = Grid(layout: .dimensions(rowCount: columnNumber, columnCount: columnNumber), frame: self.bounds)
        let frame = grid![0,0]
        let view = PlayingCardView(frame: frame!)
        view.count = .one
        view.kind = .diamond
        view.backgroundColor = .white
        addSubview(view)
//        var loopCount = playingCardsCounts
//        for i in 0..<columnNumber {
//            for j in 0..<columnNumber {
//                if (loopCount > 0) {
//                    let frame = grid![i,j]
//                    let view = UIView(frame: frame!)
//                    view.backgroundColor = getRandomColor()
//                    addSubview(view)
//                    loopCount -= 1
//                } else {
//                    break
//                }
//            }
//        }
//        print("draw")
    }
    
    private func getRandomColor() -> UIColor {
        let colors = [UIColor.red, .gray, .blue, .black, .darkGray, .cyan, .brown, .green, .orange, .magenta]
        return colors[Int.random(in: 0..<colors.count)]
    }

}

