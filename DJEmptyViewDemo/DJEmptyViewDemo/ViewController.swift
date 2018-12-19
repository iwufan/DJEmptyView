//
//  ViewController.swift
//  DJEmptyViewDemo
//
//  Created by 贾大伟 on 2018/12/19.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 无数据
        let noDataButton = UIButton(frame: CGRect(x: 130, y: 300, width: 100, height: 50))
        noDataButton.setTitle("无数据", for: .normal)
        noDataButton.setTitleColor(UIColor.orange, for: .normal)
        noDataButton.addTarget(self, action: #selector(clickNoData), for: .touchUpInside)
        
        view.addSubview(noDataButton)
        // 无网络
        let noNetworkButton = UIButton(frame: CGRect(x: 130, y: 400, width: 100, height: 50))
        noNetworkButton.setTitle("无网络", for: .normal)
        noNetworkButton.setTitleColor(UIColor.blue, for: .normal)
        noNetworkButton.addTarget(self, action: #selector(clickNoNetwork), for: .touchUpInside)
        
        view.addSubview(noNetworkButton)
    }
}

extension ViewController {
    
    @objc private func clickNoData() {
        
        navigationController?.pushViewController(NoDataViewController(), animated: true)
    }
    
    @objc private func clickNoNetwork() {
        
        navigationController?.pushViewController(NoNetworkViewController(), animated: true)
    }
}

