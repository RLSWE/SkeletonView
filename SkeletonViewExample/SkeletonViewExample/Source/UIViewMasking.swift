//
//  UIViewMasking.swift
//  SkeletonViewExample
//
//  Created by Roni Leshes on 3/17/18.
//  Copyright © 2018 Roni Leshes. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Apply given views as masks
    ///
    /// - Parameter views: Views to apply as mask.
    /// ## Note: The view calling this function must have all the views in the given array as subviews.
    func setMaskingViews(_ views:[UIView]){

        let mutablePath = CGMutablePath()

        //Append path for each subview
        views.forEach { (view) in
            guard self.subviews.contains(view) else{
                fatalError("View:\(view) is not a subView of \(self). Therefore, it cannot be a masking view.")
            }
            //Check if ellipse
            if view.layer.cornerRadius == view.frame.size.height / 2, view.layer.masksToBounds{
                //Ellipse
                mutablePath.addEllipse(in: view.frame)
            }else{
                //Rect
                mutablePath.addRect(view.frame)
            }
        }
        
        //Create layer
        let maskLayer = CAShapeLayer()
        maskLayer.path = mutablePath
        
        //Apply layer as a mask
        self.layer.mask = maskLayer
    }
}

