//
//  MarsRover.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 7/5/24.
//

import Foundation

class MarsRover {
    init(
        x: Int,
        y: Int,
        direction: String
    ) {
        self.position = Position(x: x, y: y)
        switch direction {
        case "N": self.direction = NorthState()
        case "S": self.direction = SouthState()
        case "E": self.direction = EastState()
        case "W": self.direction = WestState()
        default: self.direction = NorthState()
        }
    }

    private var position: Position
    private var direction: RoverDirectionState

    private let mars = Mars()

    func execute(command: String) {
        for char in command {
            switch char {
            case "f": position = moveForward()
            case "b": position = moveBackward()
            case "l": direction = direction.turnLeft()
            case "r": direction = direction.turnRight()
            default: break
            }
        }
        print("Current position: \(position.x), \(position.y), \(direction)")
    }

    func getX() -> Int { position.x }
    func getY() -> Int { position.y }
    func getDirection() -> String { direction.toString() }

    private func moveForward() -> Position {
        var newPosition = position
        switch direction {
        case is NorthState: newPosition.y = (position.y == mars.limitY) ? 0 : (position.y + 1)
        case is SouthState: newPosition.y = (position.y == 0) ? mars.limitY : (position.y - 1)
        case is EastState: newPosition.x = (position.x == mars.limitX) ? 0 : (position.x + 1)
        case is WestState: newPosition.x = (position.x == 0) ? mars.limitX : (position.x - 1)
        default: break
        }
        return newPosition
    }

    private func moveBackward() -> Position {
        var newPosition = position
        switch direction {
        case is NorthState: newPosition.y = (position.y == 0) ? mars.limitY : (position.y - 1)
        case is SouthState: newPosition.y = (position.y == mars.limitY) ? 0 : (position.y + 1)
        case is EastState: newPosition.x = (position.x == 0) ? mars.limitX : (position.x - 1)
        case is WestState: newPosition.x = (position.x == mars.limitX) ? 0 : (position.x + 1)
        default: break
        }
        return newPosition
    }
}
