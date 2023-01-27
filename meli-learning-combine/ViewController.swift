//
//  ViewController.swift
//  meli-learning-combine
//
//  Created by Marcos Felipe Souza Pinto on 16/01/23.
//

import UIKit

extension ViewController {
    enum Constants {
        enum Text {
            static let online = "Online"
            static let offline = "Offline"
            static let tapHere = "Tap here!"
        }
    }
}

class ViewController: UIViewController{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultValuesView: ResultValuesView!
    @IBOutlet weak var textInputView: TextInputView!
    @IBOutlet weak var customButton: ButtonCustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        textInputView.delegate = self
        titleLabel.text = ""
        customButton.didTapHandle = {
            print(Constants.Text.tapHere)
        }
    }

    func updateTitleLabel(
        text: String? = nil,
        isEnable: Bool? = nil
    ) {

        removeSwitcherWord()

        if let text {
            titleLabel.text = text + " "
        }
        let enableText = (isEnable ?? false) ? Constants.Text.online : Constants.Text.offline
        titleLabel.text?.append(enableText)
    }

    func removeSwitcherWord() {
        guard let titleLabelText = titleLabel.text else { return }
        titleLabel.text = titleLabelText
            .replacingOccurrences(of: Constants.Text.offline, with: "")
            .replacingOccurrences(of: Constants.Text.online, with: "")
    }

}

extension ViewController: TextInputViewDelegate {
    func didChangeText(_ text: String) {
        updateTitleLabel(text: text)
    }

    func didChangeSwith(_ isOn: Bool) {
        updateTitleLabel(isEnable: isOn)
        resultValuesView.didChangeSwith(isOn)
    }
}
