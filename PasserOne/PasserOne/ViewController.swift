//
//  ViewController.swift
//  PasserOne
//
//  Created by Ariel Elkin on 16/04/2018.
//  Copyright © 2018 ariel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let textLabel = UILabel()

    var string: String? {
        didSet {
            textLabel.text = string
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildUI()
    }

    func buildUI() {

        view.backgroundColor = .orange

        textLabel.text = "Passer One"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)

        let button = UIButton()
        button.setTitle("Transfer", for: .normal)
        button.addTarget(self, action: #selector(transfer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)


        NSLayoutConstraint.activate(
            [textLabel.topAnchor.constraintEqualToSystemSpacingBelow(view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
             textLabel.heightAnchor.constraint(equalToConstant: 100),
             textLabel.leadingAnchor.constraintEqualToSystemSpacingAfter(view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
             view.safeAreaLayoutGuide.trailingAnchor.constraintEqualToSystemSpacingAfter(textLabel.trailingAnchor, multiplier: 1),

             button.topAnchor.constraint(equalTo: textLabel.bottomAnchor),
             button.leadingAnchor.constraintEqualToSystemSpacingAfter(view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
             view.safeAreaLayoutGuide.trailingAnchor.constraintEqualToSystemSpacingAfter(button.trailingAnchor, multiplier: 1)
            ]
        )
    }

    @objc func transfer() {

        guard let defaults = UserDefaults(suiteName: "group.com.ariel.passers"),
            let message = textLabel.text?.toBase64() else {
            return assertionFailure()
        }

        defaults.set(message, forKey: "message")

        let url = URL(string: "com.ariel.passertwo://")!
        UIApplication.shared.open(url, options: [:]) { (success) in
            assert(success)
        }
    }
}

// https://stackoverflow.com/a/47693776/1072846
extension String {

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }

    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
}


