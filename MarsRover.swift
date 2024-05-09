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
        status.direction = DirectionFactory().createDirection(direction: direction)
    }

    private var status: RoverStatus

    func execute(command: String) {
        for char in command {
            status = CommandFactory().createCommand(command: String(char), status: status).execute()
        }
    }

    func getX() -> Int { status.position.x }
    func getY() -> Int { status.position.y }
    func getDirection() -> String { status.direction.toString() }
}
