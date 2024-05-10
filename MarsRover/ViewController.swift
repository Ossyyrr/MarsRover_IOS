//
//  ViewController.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 7/5/24.
//
import UIKit

class ViewController: UIViewController {
    let gridSize: CGFloat = 10
    var squareSize: CGFloat = 0
    var gridView: GridView!
    var customInputView: InputView!
    var controlButtonsView: ControlButtonsView!

    override func viewDidLoad() {
        super.viewDidLoad()

        squareSize = min(view.bounds.width, view.bounds.height) / gridSize

        gridView = GridView(frame: CGRect(x: 0, y: 100, width: squareSize * gridSize, height: squareSize * gridSize), squareSize: squareSize)
        view.addSubview(gridView)

        customInputView = InputView(frame: CGRect(x: 0, y: gridView.frame.maxY + 20, width: view.bounds.width, height: 100))
        customInputView.delegate = self
        view.addSubview(customInputView)

        controlButtonsView = ControlButtonsView(frame: CGRect(x: 0, y: customInputView.frame.maxY + 20, width: view.bounds.width, height: 80))
        controlButtonsView.delegate = self
        view.addSubview(controlButtonsView)
    }
}

extension ViewController: InputViewDelegate {
    func startButtonTapped(with commands: String) {
        print("Comandos ingresados: \(commands)")
    }
}

extension ViewController: ControlButtonsViewDelegate {
    func rotateLeftButtonTapped() {
        // Lógica para rotar a la izquierda
    }

    func rotateRightButtonTapped() {
        // Lógica para rotar a la derecha
    }

    func moveForwardButtonTapped() {
        // Lógica para mover hacia adelante
    }

    func moveBackwardButtonTapped() {
        // Lógica para mover hacia atrás
    }
}
