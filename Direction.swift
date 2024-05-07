//
//  Direction.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 7/5/24.
//

// STATE PATTERN
import Foundation

protocol DirectionState {
    func turnRight() -> DirectionState
    func turnLeft() -> DirectionState
    func toString() -> String
}

class North: DirectionState {
    func turnRight() -> DirectionState { East() }
    func turnLeft() -> DirectionState { West() }
    func toString() -> String { "N" }
}

class South: DirectionState {
    func turnRight() -> DirectionState { West() }
    func turnLeft() -> DirectionState { East() }
    func toString() -> String { "S" }
}

class East: DirectionState {
    func turnRight() -> DirectionState { South() }
    func turnLeft() -> DirectionState { North() }
    func toString() -> String { "E" }
}

class West: DirectionState {
    func turnRight() -> DirectionState { North() }
    func turnLeft() -> DirectionState { South() }
    func toString() -> String { "W" }
}
