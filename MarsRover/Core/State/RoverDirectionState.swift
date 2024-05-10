//
//  Direction.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 7/5/24.
//

// STATE PATTERN
import Foundation

protocol RoverDirectionState {
    func turnRight() -> RoverDirectionState
    func turnLeft() -> RoverDirectionState
    func toString() -> String
}

class NorthState: RoverDirectionState {
    func turnRight() -> RoverDirectionState { EastState() }
    func turnLeft() -> RoverDirectionState { WestState() }
    func toString() -> String { "N" }
}

class SouthState: RoverDirectionState {
    func turnRight() -> RoverDirectionState { WestState() }
    func turnLeft() -> RoverDirectionState { EastState() }
    func toString() -> String { "S" }
}

class EastState: RoverDirectionState {
    func turnRight() -> RoverDirectionState { SouthState() }
    func turnLeft() -> RoverDirectionState { NorthState() }
    func toString() -> String { "E" }
}

class WestState: RoverDirectionState {
    func turnRight() -> RoverDirectionState { NorthState() }
    func turnLeft() -> RoverDirectionState { SouthState() }
    func toString() -> String { "W" }
}
