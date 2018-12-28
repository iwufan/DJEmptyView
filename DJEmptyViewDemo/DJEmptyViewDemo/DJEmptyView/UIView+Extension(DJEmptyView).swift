//
//  UIView+Extension.swift
//  EmptyViewDemo
//
//  Created by David Jia on 2018/11/30.
//  Copyright © 2018 david. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func getEmptyView() -> DJEmptyView? {
        
        var emptyView: DJEmptyView?
        
        for view in subviews {
            if view.tag == -1 {
                emptyView = view as? DJEmptyView
                break
            }
        }

        return emptyView
    }

    public func dj_showEmptyView(_ emptyView: DJEmptyView) {
        
        var isExist: Bool = false
        
        subviews.forEach { (view) in
            if view.tag == -1 {
                isExist = true
            }
        }
        
        if isExist {
            return
        }
        
        emptyView.tag = -1
        
        emptyView.frame = bounds
        
        addSubview(emptyView)
    }
    
    public func dj_hideEmptyView() {
        
        subviews.forEach { (view) in
            if view.tag == -1 {
                view.removeFromSuperview()
            }
        }
    }
}

