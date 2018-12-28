//
//  NoDataRefreshViewController.swift
//  DJEmptyViewDemo
//
//  Created by David Jia on 2018/12/22.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit
import ESPullToRefresh


class NoDataRefreshViewController: UIViewController {

    private var pageNumber: Int!
    
    let navHeight = UIApplication.shared.statusBarFrame.height + 44

    lazy var dataArray: [String] = {
        return []
    }()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate  = self
        tableView.rowHeight = 40
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        
        var header = ESRefreshHeaderAnimator()
        var footer = ESRefreshFooterAnimator()
        
        tableView.es.addPullToRefresh(animator: header, handler: {
            self.loadNewData()
        })
        
        tableView.frame = CGRect(x: 0, y: navHeight, width: view.bounds.width, height: view.bounds.height)
        
        view.addSubview(tableView)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray

        loadData()
    }

}
extension NoDataRefreshViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "CellID"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = dataArray[indexPath.row]
        
        return cell!
    }
}

extension NoDataRefreshViewController {
    
    /// pull to refresh
    @objc private func loadNewData() {
        
        pageNumber = 1
        
        for i in 0..<50 {
            dataArray.append("\(i)")
        }
        
        loadData()
        // 停止刷新动画
        tableView.es.stopPullToRefresh()
    }
    
    private func loadData() {

        if dataArray.count == 0 {
            self.tableView.dj_showEmptyView(DJEmptyView(tipInfo: "No Related Data", imageName: "dj_img_no_data"))
        } else {
            self.tableView.dj_hideEmptyView()
        }
        
        tableView.reloadData()
    }
}
