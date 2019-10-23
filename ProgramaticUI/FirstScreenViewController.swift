//
//  FirstScreenViewController.swift
//  ProgramaticUI
//
//  Created by Thiago B Claramunt on 21/10/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink: UIColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class FirstScreenViewController: UIViewController {
    
    let authobiographyImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "authobiography.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let atributedText = NSMutableAttributedString(string: "Seja bem vindo", attributes: [.font: UIFont.boldSystemFont(ofSize: 18)])
        atributedText.append(NSAttributedString(string: "\n\nVocê está pronto para muita leitura? Não perca mais tempo e crie sua conta agora mesmo.", attributes: [.font: UIFont.systemFont(ofSize: 13), .foregroundColor: UIColor.darkGray    ]))
        textView.attributedText = atributedText
        //        textView.text = "Seja bem vindo!"
        //        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.currentPage = 0
        pc.numberOfPages = 4
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupBottomControls()
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.backgroundColor = .white
        
        topImageContainerView.addSubview(authobiographyImageView)
        view.addSubview(descriptionTextView)
        
        authobiographyImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        authobiographyImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        authobiographyImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView: UIStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.axis = .horizontal
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
    } 
    
    
}
