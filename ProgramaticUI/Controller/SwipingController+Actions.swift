//
//  SwipingController+Actions.swift
//  ProgramaticUI
//
//  Created by Thiago B Claramunt on 23/10/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

extension SwipingController {
    @objc func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath: IndexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handleBack() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath: IndexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}
