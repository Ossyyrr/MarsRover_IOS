//
//  MarsRover.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 7/5/24.
//

import Foundation

class MarsRover {
    private var x: Int
    private var y: Int
    private var direction: DirectionState

    private let mars = Mars()

    init(
        x: Int,
        y: Int,
        direction: String
    ) {
        self.x = x
        self.y = y
        switch direction {
        case "N": self.direction = North()
        case "S": self.direction = South()
        case "E": self.direction = East()
        case "W": self.direction = West()
        default: self.direction = North()
        }
    }

    func execute(command: String) {
        for char in command {
            switch char {
            case "f": moveForward()
            case "b": moveBackward()
            case "l": turnLeft()
            case "r": turnRight()
            default: break
            }
        }

        print("Current position: \(x), \(y), \(direction)")
    }

    func getX() -> Int { x }
    func getY() -> Int { y }
    func getDirection() -> String { direction.toString() }

    private func moveForward() {
        switch direction {
        case is North: y = (y == mars.limitY) ? 0 : (y + 1)
        case is South: y = (y == 0) ? mars.limitY : (y - 1)
        case is East: x = (x == mars.limitX) ? 0 : (x + 1)
        case is West: x = (x == 0) ? mars.limitX : (x - 1)
        default: break
        }
    }

    private func moveBackward() {
        switch direction {
        case is North: y = (y == 0) ? mars.limitY : (y - 1)
        case is South: y = (y == mars.limitY) ? 0 : (y + 1)
        case is East: x = (x == 0) ? mars.limitX : (x - 1)
        case is West: x = (x == mars.limitX) ? 0 : (x + 1)
        default: break
        }
    }

    private func turnLeft() {
        switch direction {
        case is North: direction = West()
        case is South: direction = East()
        case is East: direction = North()
        case is West: direction = South()
        default: break
        }
    }

    private func turnRight() {
        switch direction {
        case is North: direction = East()
        case is South: direction = West()
        case is East: direction = South()
        case is West: direction = North()
        default: break
        }
    }
}
