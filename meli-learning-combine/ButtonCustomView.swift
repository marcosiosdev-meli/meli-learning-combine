//
//  ButtonCustomView.swift
//  meli-learning-combine
//
//  Created by Marcos Felipe Souza Pinto on 18/01/23.
//

import UIKit

class ButtonCustomView: UIView {

    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap Here"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemIndigo
        return label
    }()

    var didTapHandle: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        backgroundColor = .systemGray
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }

    @objc
    func didTap() {
        didTapHandle?()
    }
}
