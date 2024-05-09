//
//  CommandFactory.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 9/5/24.
//

import Foundation

class CommandFactory {
    func createCommand(command: String, status: RoverStatus) -> RoverCommand {
        switch command {
        case "f": return MoveForwardCommand(roverStatus: status)
        case "b": return MoveBackwardCommand(roverStatus: status)
        case "l": return TurnLeftCommand(status: status)
        case "r": return TurnRightCommand(status: status)
        default: return MoveForwardCommand(roverStatus: status)
        }
    }
}
