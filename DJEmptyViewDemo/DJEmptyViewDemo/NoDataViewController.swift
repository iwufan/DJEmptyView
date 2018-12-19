//
//  NoDataViewController.swift
//  DJEmptyViewDemo
//
//  Created by 贾大伟 on 2018/12/19.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit

/// 无数据页面
class NoDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        view.dj_showEmptyView(DJEmptyView(imageName: "dj_img_no_data"))
    }

}
