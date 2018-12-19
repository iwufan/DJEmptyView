//
//  NoNetworkViewController.swift
//  DJEmptyViewDemo
//
//  Created by 贾大伟 on 2018/12/19.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit

/// 无网络页面
class NoNetworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        view.dj_showEmptyView(DJEmptyView(tipInfo: "网络连接失败", imageName: "dj_img_no_network"))
    }

}
