//
//  SwipingController.swift
//  ProgramaticUI
//
//  Created by Thiago B Claramunt on 23/10/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)

        return button
    }()
    
     lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        return pc
    }()
    
    let pages: [Page] = [
        Page(imageName: "authobiography", headerText: "Seja bem vindo", bodyText: "O melhor app para ler livros do mundo!"),
        Page(imageName:  "humour", headerText: "Crie sua conta!", bodyText: "É grátis, é simples, é bom para leitura."),
        Page(imageName: "magical", headerText: "Os melhores livros ao seu alcance!", bodyText: "Uma biblioteca virtual com mais de 10 mil livros prontinhos para você ler no seu celular"),
        Page(imageName: "shakespeare", headerText: "Compartile com seus amigos!", bodyText: "Ler com amigos é muito mais divertido!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.isPagingEnabled = true
        
        setupBottomControls()
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
