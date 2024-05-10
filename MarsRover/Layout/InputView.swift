//
//  InputView.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 10/5/24.
//

import UIKit

protocol InputViewDelegate: AnyObject {
    func startButtonTapped(with commands: String)
}

class InputView: UIView {
    weak var delegate: InputViewDelegate?

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingrese comandos"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(textField)
        addSubview(startButton)

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40),

            startButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func startButtonTapped() {
        guard let commands = textField.text else { return }
        delegate?.startButtonTapped(with: commands)
    }
}
