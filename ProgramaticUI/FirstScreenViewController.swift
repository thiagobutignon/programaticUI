//
//  FirstScreenViewController.swift
//  ProgramaticUI
//
//  Created by Thiago B Claramunt on 21/10/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    let nextButton: UIButton = UIButton()
    let nextLabel: UILabel = UILabel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.setupNextButton()
    }
    
    func setupNextButton() {
        self.nextButton.backgroundColor = .white
        self.nextButton.setTitleColor(.red, for: .normal)
        self.nextButton.setTitle("Next", for: .normal)
        
        self.nextButton.addTarget(self, action: #selector(self.nextButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
        self.setNextButtonContraints()
    }
    
    @objc func nextButtonTapped() {
        let nextScreen: SecondScreenViewController = SecondScreenViewController()
        nextScreen.title = "Oh Yeah!"
        navigationController?.pushViewController(nextScreen, animated: true)
    }

    func setNextButtonContraints() {
        self.nextButton.translatesAutoresizingMaskIntoConstraints = false
        self.nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
