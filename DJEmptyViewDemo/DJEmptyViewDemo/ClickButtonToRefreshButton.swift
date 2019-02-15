//
//  ClickButtonToRefreshButton.swift
//  DJEmptyViewDemo
//
//  Created by 贾大伟 on 2019/2/15.
//  Copyright © 2019 david. All rights reserved.
//

import UIKit

class ClickButtonToRefreshButton: UIViewController {
    
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
extension ClickButtonToRefreshButton: UITableViewDelegate, UITableViewDataSource {
    
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

extension ClickButtonToRefreshButton {
    
    private func loadData() {
        
        if dataArray.count == 0 {
            let emptyView = DJEmptyView(imageName: "dj_img_no_data", imageTopOffset: 0)
            emptyView.buttonTitle = "Refresh"
            emptyView.buttonBackgroundColor = .red
            emptyView.clickClosure = {
                for i in 0..<50 {
                    self.dataArray.append("\(i)")
                }
                self.loadData()
            }
            self.tableView.dj_showEmptyView(emptyView)
        } else {
            self.tableView.dj_hideEmptyView()
        }
        
        tableView.reloadData()
    }
}
