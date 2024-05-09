//
//  MarsRoverTests.swift
//  MarsRoverTests
//
//  Created by Patricia Manzanero on 7/5/24.
//

@testable import MarsRover
import XCTest

final class MarsRoverTests: XCTestCase {
    var marsRover: MarsRover!
 

    override func setUpWithError() throws {
        marsRover = MarsRover(x: 1, y: 4, direction: "N")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitRoverWithParams() throws {
        XCTAssertEqual(marsRover.getX(), 1)
        XCTAssertEqual(marsRover.getY(), 4)
        XCTAssertEqual(marsRover.getDirection(), "N")
    }

    func testMoveFordward() throws {
        marsRover.execute(command: "f")

        XCTAssertEqual(marsRover.getX(), 1)
        XCTAssertEqual(marsRover.getY(), 5)
        XCTAssertEqual(marsRover.getDirection(), "N")

        marsRover.execute(command: "r")
        marsRover.execute(command: "f")

        XCTAssertEqual(marsRover.getX(), 2)

        marsRover.execute(command: "r")
        marsRover.execute(command: "f")

        XCTAssertEqual(marsRover.getY(), 4)

        marsRover.execute(command: "r")
        marsRover.execute(command: "f")

        XCTAssertEqual(marsRover.getX(), 1)
    }

    func testMoveBackward() throws {
        marsRover.execute(command: "b")

        XCTAssertEqual(marsRover.getX(), 1)
        XCTAssertEqual(marsRover.getY(), 3)
        XCTAssertEqual(marsRover.getDirection(), "N")

        marsRover.execute(command: "r")
        marsRover.execute(command: "b")

        XCTAssertEqual(marsRover.getX(), 0)

        marsRover.execute(command: "r")
        marsRover.execute(command: "b")

        XCTAssertEqual(marsRover.getY(), 4)

        marsRover.execute(command: "r")
        marsRover.execute(command: "b")

        XCTAssertEqual(marsRover.getX(), 1)
    }

    func testTurnLeft() throws {
        marsRover.execute(command: "l")

        XCTAssertEqual(marsRover.getX(), 1)
        XCTAssertEqual(marsRover.getY(), 4)
        XCTAssertEqual(marsRover.getDirection(), "W")

        marsRover.execute(command: "l")
        XCTAssertEqual(marsRover.getDirection(), "S")

        marsRover.execute(command: "l")
        XCTAssertEqual(marsRover.getDirection(), "E")

        marsRover.execute(command: "l")
        XCTAssertEqual(marsRover.getDirection(), "N")
    }

    func testTurnRight() throws {
        marsRover.execute(command: "r")

        XCTAssertEqual(marsRover.getX(), 1)
        XCTAssertEqual(marsRover.getY(), 4)
        XCTAssertEqual(marsRover.getDirection(), "E")

        marsRover.execute(command: "r")
        XCTAssertEqual(marsRover.getDirection(), "S")

        marsRover.execute(command: "r")
        XCTAssertEqual(marsRover.getDirection(), "W")

        marsRover.execute(command: "r")
        XCTAssertEqual(marsRover.getDirection(), "N")
    }

    func testMarsLimit() throws {
        marsRover = MarsRover(x: 0, y: 0, direction: "N")

        marsRover.execute(command: "b") // 10, 0

        XCTAssertEqual(marsRover.getX(), 0)
        XCTAssertEqual(marsRover.getY(), Mars.limitY)
    }

    func testBigCommand() throws {
        marsRover = MarsRover(x: 0, y: 0, direction: "N")
        marsRover.execute(command: "fffrfflb") // 2, 2

        XCTAssertEqual(marsRover.getX(), 2)
        XCTAssertEqual(marsRover.getY(), 2)
        XCTAssertEqual(marsRover.getDirection(), "N")
    }

    func testBigCommandBetweenLimits() throws {
        marsRover = MarsRover(x: 0, y: 0, direction: "S")
        marsRover.execute(command: "fffrfflb") // 9, 9

        XCTAssertEqual(marsRover.getX(), 9)
        XCTAssertEqual(marsRover.getY(), 9)
        XCTAssertEqual(marsRover.getDirection(), "S")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
