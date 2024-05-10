//
//  File.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 9/5/24.
//

import Foundation

struct RoverStatus {
    var position: Position
    var direction: RoverDirectionState

    init(position: Position, direction: RoverDirectionState) {
        self.position = position
        self.direction = direction
    }
}
