//
//  TextInputView.swift
//  meli-learning-combine
//
//  Created by Marcos Felipe Souza Pinto on 16/01/23.
//

import UIKit

protocol TextInputViewDelegate: AnyObject {
    func didChangeText(_ text: String)
    func didChangeSwith(_ isOn: Bool)
}

class TextInputView: UIView, UITextFieldDelegate {

    private lazy var descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "text something"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()

    private lazy var switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemCyan
        switcher.thumbTintColor = .systemBlue
        switcher.addTarget(self, action: #selector(changeSwitch), for: .valueChanged)
        return switcher
    }()

    private var containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()

    weak var delegate: TextInputViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        addSubview(containerStack)
        containerStack.addArrangedSubview(descriptionTextField)
        containerStack.addArrangedSubview(switcher)
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: topAnchor),
            containerStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @objc
    private func changeSwitch() {
        delegate?.didChangeSwith(switcher.isOn)
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {

        guard let text = textField.text as? NSString else { return true }
        let newString = text.replacingCharacters(in: range, with: string)
        delegate?.didChangeText(newString)
        return true
    }

}
