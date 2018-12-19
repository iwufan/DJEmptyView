//
//  DJEmptyView.swift
//  EmptyViewDemo
//
//  Created by 贾大伟 on 2018/11/30.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit

/// 空页面
public class DJEmptyView: UIView {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    private var bgView: UIView!
    private var imageView: UIImageView!
    private var tipInfo: String!
    private var imageName: String!
    
    public var imageTopOffset: CGFloat! {
        didSet {
            var frame = bgView.frame
            frame.origin.y = getNavigationBarHeight() + imageTopOffset
            bgView.frame = frame
        }
    }

    private var messageLabel: UILabel!
    
    public init(tipInfo: String = "暂无数据", imageName: String = "dj_img_no_data", imageTopOffset: CGFloat = 133) {
        super.init(frame: CGRect())
        self.tipInfo = tipInfo
        self.imageName = imageName
        self.imageTopOffset = imageTopOffset

        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DJEmptyView {
    
    private func addViews() {
        
        // 背景
        bgView = UIView(frame: CGRect(x: 0, y: (getNavigationBarHeight() + imageTopOffset), width: screenWidth, height: 251))
        
        addSubview(bgView)
        
        // 图
        if let image = UIImage(named: imageName) {
            
            imageView = UIImageView(image: image)
            
            let imageViewX = (bgView.frame.width - image.size.width) / 2
            imageView.frame = CGRect(x: imageViewX, y: 0, width: image.size.width, height: image.size.height)
            
            bgView.addSubview(imageView)
        }
        // 提示文字
        messageLabel = UILabel()
        messageLabel.text = tipInfo
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = UIColor.darkGray
        messageLabel.textAlignment = .center
        
        let messageY = imageView.frame.maxY + 11
        messageLabel.frame = CGRect(x: 0, y: messageY, width: screenWidth, height: 20)
        
        bgView.addSubview(messageLabel)
    }
}

extension DJEmptyView {
    /// height of navigation bar
    private func getNavigationBarHeight() -> CGFloat {
        
        let statusHeight = UIApplication.shared.statusBarFrame.height
        return statusHeight + 44
    }
}
