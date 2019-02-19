//
//  NoDataViewController.swift
//  DJEmptyViewDemo
//
//  Created by David Jia on 2018/12/19.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit

/// no data
class NoDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        let emptyView = DJEmptyView(tipInfo:"No Related Data", imageName: "dj_img_no_data")
        emptyView.tipColor = UIColor.red
        view.dj_showEmptyView(emptyView)
    }

}
