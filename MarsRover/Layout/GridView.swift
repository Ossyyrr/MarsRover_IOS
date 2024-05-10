//
//  GridView.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 10/5/24.
//
import UIKit

class GridView: UIView {
    let gridSize = 10
    let squareSize: CGFloat
    var imageView: ImageView?

    init(frame: CGRect, squareSize: CGFloat) {
        self.squareSize = squareSize
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.black.cgColor)

        // Draw horizontal lines
        for i in 0..<gridSize {
            context?.move(to: CGPoint(x: 0, y: CGFloat(i) * squareSize))
            context?.addLine(to: CGPoint(x: frame.width, y: CGFloat(i) * squareSize))
        }

        // Draw vertical lines
        for i in 0..<gridSize {
            context?.move(to: CGPoint(x: CGFloat(i) * squareSize, y: 0))
            context?.addLine(to: CGPoint(x: CGFloat(i) * squareSize, y: frame.height))
        }

        context?.strokePath()

        // Show image in square 5-5
        if imageView == nil {
            let imageViewSize = squareSize
            let imageViewFrame = CGRect(x: 4 * squareSize, y: 4 * squareSize, width: imageViewSize, height: imageViewSize)
            imageView = ImageView(frame: imageViewFrame)
            addSubview(imageView!)
        }

        // Load and set image from assets
        imageView?.setImage(named: "rover")
    }
}
