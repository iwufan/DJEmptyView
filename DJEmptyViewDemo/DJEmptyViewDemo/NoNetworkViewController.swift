//
//  NoNetworkViewController.swift
//  DJEmptyViewDemo
//
//  Created by David Jia on 2018/12/19.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit

/// No Network
class NoNetworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        view.dj_showEmptyView(DJEmptyView(tipInfo: "Network connect failed", imageName: "dj_img_no_network"))
    }

}
