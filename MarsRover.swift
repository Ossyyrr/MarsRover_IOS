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
    private var direction: String

    init(
        x: Int,
        y: Int,
        direction: String
    ) {
        self.x = x
        self.y = y
        self.direction = direction
    }

    func execute(command: String) {
        print("EXECUTING " + command)
        if command == "f" { moveFordward() }
        if command == "b" { moveBackward() }
        if command == "l" { turnLeft() }
        if command == "r" { turnRight() }
        print("Current position: \(x), \(y), \(direction)")
    }

    func getX() -> Int { x }

    func getY() -> Int { y }

    func getDirection() -> String { direction }

    private func moveFordward() {
        if direction == "N" { y += 1 }
        if direction == "S" { y -= 1 }
        if direction == "E" { x += 1 }
        if direction == "W" { x -= 1 }
    }

    private func moveBackward() {
        switch direction {
        case "N": y -= 1
        case "S": y += 1
        case "E": x -= 1
        case "W": x += 1
        default: break
        }
    }

    private func turnLeft() {
        switch direction {
        case "N": direction = "W"
        case "S": direction = "E"
        case "E": direction = "N"
        case "W": direction = "S"
        default: break
        }
    }

    private func turnRight() {
        switch direction {
        case "N": direction = "E"
        case "S": direction = "W"
        case "E": direction = "S"
        case "W": direction = "N"
        default: break
        }
    }
}
