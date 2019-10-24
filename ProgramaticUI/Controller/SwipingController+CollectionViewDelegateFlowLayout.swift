//
//  SwipingController+CollectionViewDelegateFlowLayout.swift
//  ProgramaticUI
//
//  Created by Thiago B Claramunt on 23/10/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

extension SwipingController {
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        print(x, view.frame.width, x / view.frame.width)
    }
}
