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

    private func strategyFactory() -> MoveStrategy {
        switch status.direction {
        case is NorthState: return MoveNorth()
        case is SouthState: return MoveSouth()
        case is EastState: return MoveEast()
        case is WestState: return MoveWest()
        default: return MoveNorth()
        }
    }

    func execute() -> RoverStatus {
        let moveStrategy = strategyFactory()
        return RoverStatus(position: moveStrategy.execute(position: status.position), direction: status.direction)
    }
}

class MoveBackwardCommand: RoverCommand {
    var status: RoverStatus

    init(roverStatus: RoverStatus) {
        self.status = roverStatus
    }

    private func strategyFactory() -> MoveStrategy {
        switch status.direction {
        case is NorthState: return MoveSouth()
        case is SouthState: return MoveNorth()
        case is EastState: return MoveWest()
        case is WestState: return MoveEast()
        default: return MoveSouth()
        }
    }

    func execute() -> RoverStatus {
        let moveStrategy = strategyFactory()
        return RoverStatus(position: moveStrategy.execute(position: status.position), direction: status.direction)
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
