//
//  DirectionFactory.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 9/5/24.
//

import Foundation

class DirectionFactory {
    func createDirection(direction: String) -> RoverDirectionState {
        switch direction {
        case "N": return NorthState()
        case "S": return SouthState()
        case "E": return EastState()
        case "W": return WestState()
        default: return NorthState()
        }
    }
}
