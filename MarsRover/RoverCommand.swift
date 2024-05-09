//
//  RoverCommand.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 7/5/24.
//

protocol RoverCommand {
    func execute() -> RoverStatus
}

class MoveForwardCommand: RoverCommand {
    var status: RoverStatus

    init(roverStatus: RoverStatus) {
        self.status = roverStatus
    }

    func execute() -> RoverStatus {
        var newPosition = status.position
        switch status.direction {
        case is NorthState: newPosition.y = (status.position.y == Mars.limitY) ? 0 : (status.position.y + 1)
        case is SouthState: newPosition.y = (status.position.y == 0) ? Mars.limitY : (status.position.y - 1)
        case is EastState: newPosition.x = (status.position.x == Mars.limitX) ? 0 : (status.position.x + 1)
        case is WestState: newPosition.x = (status.position.x == 0) ? Mars.limitX : (status.position.x - 1)
        default: break
        }
        return RoverStatus(position: newPosition, direction: status.direction)
    }
}

class MoveBackwardCommand: RoverCommand {
    var status: RoverStatus

    init(roverStatus: RoverStatus) {
        self.status = roverStatus
    }

    func execute() -> RoverStatus {
        var newPosition = status.position
        switch status.direction {
        case is NorthState: newPosition.y = (status.position.y == 0) ? Mars.limitY : (status.position.y - 1)
        case is SouthState: newPosition.y = (status.position.y == Mars.limitY) ? 0 : (status.position.y + 1)
        case is EastState: newPosition.x = (status.position.x == 0) ? Mars.limitX : (status.position.x - 1)
        case is WestState: newPosition.x = (status.position.x == Mars.limitX) ? 0 : (status.position.x + 1)
        default: break
        }
        return RoverStatus(position: newPosition, direction: status.direction)
    }
}

class TurnLeftCommand: RoverCommand {
    var status: RoverStatus

    init(status: RoverStatus) {
        self.status = status
    }

    func execute() -> RoverStatus {
        RoverStatus(position: status.position, direction: status.direction.turnLeft())
    }
}

class TurnRightCommand: RoverCommand {
    var status: RoverStatus

    init(status: RoverStatus) {
        self.status = status
    }

    func execute() -> RoverStatus {
        RoverStatus(position: status.position, direction: status.direction.turnRight())
    }
}
