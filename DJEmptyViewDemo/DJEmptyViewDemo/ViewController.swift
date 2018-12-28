//
//  ViewController.swift
//  DJEmptyViewDemo
//
//  Created by David Jia on 2018/12/19.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // no data
        let noDataButton = UIButton(frame: CGRect(x: 130, y: 300, width: 100, height: 50))
        noDataButton.setTitle("No Data", for: .normal)
        noDataButton.setTitleColor(UIColor.orange, for: .normal)
        noDataButton.addTarget(self, action: #selector(clickNoData), for: .touchUpInside)
        
        view.addSubview(noDataButton)
        // no network
        let noNetworkButton = UIButton(frame: CGRect(x: 130, y: 400, width: 100, height: 50))
        noNetworkButton.setTitle("No Network", for: .normal)
        noNetworkButton.setTitleColor(UIColor.blue, for: .normal)
        noNetworkButton.addTarget(self, action: #selector(clickNoNetwork), for: .touchUpInside)
        
        view.addSubview(noNetworkButton)
        
        // refresh
        let refreshButton = UIButton(frame: CGRect(x: 130, y: 500, width: 100, height: 50))
        refreshButton.setTitle("Refresh", for: .normal)
        refreshButton.setTitleColor(UIColor.purple, for: .normal)
        refreshButton.addTarget(self, action: #selector(clickRefresh), for: .touchUpInside)
        
        view.addSubview(refreshButton)
    }
}



extension ViewController {
    
    @objc private func clickNoData() {
        
        navigationController?.pushViewController(NoDataViewController(), animated: true)
    }
    
    @objc private func clickNoNetwork() {
        
        navigationController?.pushViewController(NoNetworkViewController(), animated: true)
    }
    
    @objc private func clickRefresh() {
        
        navigationController?.pushViewController(NoDataRefreshViewController(), animated: true)
    }
}

