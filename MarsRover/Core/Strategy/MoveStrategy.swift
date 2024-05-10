//
//  MoveStrategy.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 9/5/24.
//

import Foundation

protocol MoveStrategy {
    func execute(position: Position) -> Position
}

class MoveNorth: MoveStrategy {
    func execute(position: Position) -> Position {
        return Position(x: position.x, y: (position.y == Mars.limitY) ? 0 : (position.y + 1))
    }
}

class MoveSouth: MoveStrategy {
    func execute(position: Position) -> Position {
        return Position(x: position.x, y: (position.y == 0) ? Mars.limitY : (position.y - 1))
    }
}

class MoveEast: MoveStrategy {
    func execute(position: Position) -> Position {
        return Position(x: (position.x == Mars.limitX) ? 0 : (position.x + 1), y: position.y)
    }
}

class MoveWest: MoveStrategy {
    func execute(position: Position) -> Position {
        return Position(x: (position.x == 0) ? Mars.limitX : (position.x - 1), y: position.y)
    }
}
