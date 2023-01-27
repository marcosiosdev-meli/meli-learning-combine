//
//  ResultValuesView.swift
//  meli-learning-combine
//
//  Created by Marcos Felipe Souza Pinto on 16/01/23.
//

import UIKit

class ResultValuesView: UIView {

    private let imageOn = UIImage(named: "connect")
    private let imageOff = UIImage(named: "disconnect")

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = imageOff
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension ResultValuesView: TextInputViewDelegate {
    func didChangeText(_ text: String) {}

    func didChangeSwith(_ isOn: Bool) {
        if isOn {
            UIView.transition(with: iconImageView, duration: 1.5) {
                self.iconImageView.image = self.imageOn
            }
        } else {
            UIView.transition(with: iconImageView, duration: 1.5) {
                self.iconImageView.image = self.imageOff
            }
        }
    }
}
