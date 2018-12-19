//
//  DJEmptyView.swift
//  EmptyViewDemo
//
//  Created by 贾大伟 on 2018/11/30.
//  Copyright © 2018 david. All rights reserved.
//

import UIKit

/// Empty View
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
    
    public init(tipInfo: String = "暂无数据", imageName: String, imageTopOffset: CGFloat = 133) {
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
        
        // background view
        bgView = UIView(frame: CGRect(x: 0, y: (getNavigationBarHeight() + imageTopOffset), width: screenWidth, height: 251))
        
        addSubview(bgView)
        
        // empty image
        if let image = UIImage(named: imageName) {
            
            imageView = UIImageView(image: image)
            
            let imageViewX = (bgView.frame.width - image.size.width) / 2
            imageView.frame = CGRect(x: imageViewX, y: 0, width: image.size.width, height: image.size.height)
            
            bgView.addSubview(imageView)
            // tip message
            messageLabel = UILabel()
            messageLabel.text = tipInfo
            messageLabel.font = UIFont.systemFont(ofSize: 14)
            messageLabel.textColor = UIColor.darkGray
            messageLabel.textAlignment = .center
            
            let messageY = imageView.frame.maxY + 11
            messageLabel.frame = CGRect(x: 0, y: messageY, width: screenWidth, height: 20)
            
            bgView.addSubview(messageLabel)
        } else {
            print("error: DJEmptyView - image \(imageName ?? "") doesn't exsit.")
        }
    }
}

extension DJEmptyView {
    /// height of navigation bar
    private func getNavigationBarHeight() -> CGFloat {
        
        let statusHeight = UIApplication.shared.statusBarFrame.height
        return statusHeight + 44
    }
}
