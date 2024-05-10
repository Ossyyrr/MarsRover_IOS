//
//  ControlButtonsView.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 10/5/24.
//
import UIKit

protocol ControlButtonsViewDelegate: AnyObject {
    func rotateLeftButtonTapped()
    func rotateRightButtonTapped()
    func moveForwardButtonTapped()
    func moveBackwardButtonTapped()
}

class ControlButtonsView: UIView {
    weak var delegate: ControlButtonsViewDelegate?

    lazy var rotateLeftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("L", for: .normal)
        button.addTarget(self, action: #selector(rotateLeftButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var rotateRightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("R", for: .normal)
        button.addTarget(self, action: #selector(rotateRightButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var moveForwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("F", for: .normal)
        button.addTarget(self, action: #selector(moveForwardButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var moveBackwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("B", for: .normal)
        button.addTarget(self, action: #selector(moveBackwardButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(rotateLeftButton)
        addSubview(rotateRightButton)
        addSubview(moveForwardButton)
        addSubview(moveBackwardButton)

        NSLayoutConstraint.activate([
            rotateLeftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rotateLeftButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            rotateLeftButton.widthAnchor.constraint(equalToConstant: 40),
            rotateLeftButton.heightAnchor.constraint(equalToConstant: 40),

            rotateRightButton.leadingAnchor.constraint(equalTo: rotateLeftButton.trailingAnchor, constant: 20),
            rotateRightButton.topAnchor.constraint(equalTo: rotateLeftButton.topAnchor),
            rotateRightButton.widthAnchor.constraint(equalToConstant: 40),
            rotateRightButton.heightAnchor.constraint(equalToConstant: 40),

            moveForwardButton.leadingAnchor.constraint(equalTo: rotateRightButton.trailingAnchor, constant: 20),
            moveForwardButton.topAnchor.constraint(equalTo: rotateLeftButton.topAnchor),
            moveForwardButton.widthAnchor.constraint(equalToConstant: 40),
            moveForwardButton.heightAnchor.constraint(equalToConstant: 40),

            moveBackwardButton.leadingAnchor.constraint(equalTo: moveForwardButton.trailingAnchor, constant: 20),
            moveBackwardButton.topAnchor.constraint(equalTo: rotateLeftButton.topAnchor),
            moveBackwardButton.widthAnchor.constraint(equalToConstant: 40),
            moveBackwardButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func rotateLeftButtonTapped() {
        delegate?.rotateLeftButtonTapped()
    }

    @objc private func rotateRightButtonTapped() {
        delegate?.rotateRightButtonTapped()
    }

    @objc private func moveForwardButtonTapped() {
        delegate?.moveForwardButtonTapped()
    }

    @objc private func moveBackwardButtonTapped() {
        delegate?.moveBackwardButtonTapped()
    }
}
