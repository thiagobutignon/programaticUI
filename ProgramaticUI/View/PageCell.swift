//
//  PageCell.swift
//  ProgramaticUI
//
//  Created by Thiago B Claramunt on 23/10/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage: Page = page else { return }
            
            cellImageView.image = UIImage(named: unwrappedPage.imageName)
            let atributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [.font: UIFont.boldSystemFont(ofSize: 18)])
            atributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [.font: UIFont.systemFont(ofSize: 13), .foregroundColor: UIColor.darkGray    ]))
            descriptionTextView.attributedText = atributedText
            descriptionTextView.textAlignment = .center
            
        }
    }
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "authobiography.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let atributedText = NSMutableAttributedString(string: "Seja bem vindo", attributes: [.font: UIFont.boldSystemFont(ofSize: 18)])
        atributedText.append(NSAttributedString(string: "\n\nVocê está pronto para muita leitura? Não perca mais tempo e crie sua conta agora mesmo.", attributes: [.font: UIFont.systemFont(ofSize: 13), .foregroundColor: UIColor.darkGray    ]))
        textView.attributedText = atributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(cellImageView)
        
        cellImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        cellImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        cellImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
