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
        self.status = RoverStatus(position: Position(x: x, y: y), direction: NorthState())
        switch direction {
        case "N": status.direction = NorthState()
        case "S": status.direction = SouthState()
        case "E": status.direction = EastState()
        case "W": status.direction = WestState()
        default: status.direction = NorthState()
        }
    }

    private var status: RoverStatus

    private let mars = Mars()

    func execute(command: String) {
        for char in command {
            switch char {
            case "f": status = MoveForwardCommand(roverStatus: status, mars: mars).execute()
            case "b": status = MoveBackwardCommand(roverStatus: status, mars: mars).execute()
            case "l": status = TurnLeftCommand(status: status).execute()
            case "r": status = TurnRightCommand(status: status).execute()
            default: break
            }
        }
    }

    func getX() -> Int { status.position.x }
    func getY() -> Int { status.position.y }
    func getDirection() -> String { status.direction.toString() }

    private func moveBackward() -> Position {
        var newPosition = status.position
        switch status.direction {
        case is NorthState: newPosition.y = (status.position.y == 0) ? mars.limitY : (status.position.y - 1)
        case is SouthState: newPosition.y = (status.position.y == mars.limitY) ? 0 : (status.position.y + 1)
        case is EastState: newPosition.x = (status.position.x == 0) ? mars.limitX : (status.position.x - 1)
        case is WestState: newPosition.x = (status.position.x == mars.limitX) ? 0 : (status.position.x + 1)
        default: break
        }
        return newPosition
    }
}
