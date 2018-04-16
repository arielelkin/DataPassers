//
//  ViewController.swift
//  PasserTwo
//
//  Created by Ariel Elkin on 16/04/2018.
//  Copyright © 2018 ariel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     Create 2 apps that call each other and pass some meaningful parameter.
     For example App A might contain a text area and, at the press of a button, start App B and pass to it the content of the text area.
     App B will then somehow process that text and pass it back to App A using another approach.

     Explain the technique used, possible alternatives with pros and cons of different approaches, specifically regarding security.

     

     Use Asymmetric Encryption

     

 */

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

        view.backgroundColor = .gray


        textLabel.text = "Lorem Ipsum"
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

        guard let text = textLabel.text?.toBase64() else {
            return assertionFailure()
        }

        let url = URL(string: "com.ariel.passerone://\(text.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)")!
        UIApplication.shared.open(url, options: [:]) { (success) in
            assert(success)
        }
    }

}


