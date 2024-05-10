//
//  ImageView.swift
//  MarsRover
//
//  Created by Patricia Manzanero on 10/5/24.
//

import UIKit

class ImageView: UIView {
    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setImage(named imageName: String) {
        guard let image = UIImage(named: imageName) else {
            fatalError("Image named \(imageName) not found")
        }
        imageView.image = image
    }
}
