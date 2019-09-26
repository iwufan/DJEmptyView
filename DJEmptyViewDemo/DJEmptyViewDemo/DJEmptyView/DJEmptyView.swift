//
//  DJEmptyView.swift
//  EmptyViewDemo
//
//  Created by David Jia on 2018/11/30.
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
    
    /// offset between navigationbar and image
    public var imageTopOffset: CGFloat! {
        didSet {
            var frame = bgView.frame
            frame.origin.y = getNavigationBarHeight() + imageTopOffset
            bgView.frame = frame
        }
    }
    /// tip text color
    public var tipColor: UIColor! {
        didSet {
            messageLabel.textColor = tipColor
        }
    }
    /// closure for click refresh button
    public var clickClosure: (() -> Void)!
    /// title for refresh button
    public var buttonTitle: String! {
        didSet {
            messageLabel.isHidden = true
            refreshButton.isHidden = false
            refreshButton.setTitle(buttonTitle, for: .normal)
            
            var frame = bgView.frame
            frame.size.height = 266
            bgView.frame = frame
        }
    }
    /// background color for refresh button
    public var buttonBackgroundColor: UIColor! {
        didSet {
            refreshButton.backgroundColor = buttonBackgroundColor
        }
    }
    
    private var messageLabel: UILabel!
    private var refreshButton: UIButton!
    
    public init(tipInfo: String = "No Data", imageName: String, imageTopOffset: CGFloat = 133) {
        super.init(frame: CGRect())
        self.tipInfo = tipInfo
        self.imageName = imageName
        self.imageTopOffset = imageTopOffset
        
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// You can hit the components below the empty view
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        
        if hitView == self {
            return nil
        }
        
        return hitView
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
            
            let imageWidth = image.size.width >= screenWidth ? screenWidth : image.size.width
            let imageViewX = (bgView.frame.width - imageWidth) / 2
            imageView.frame = CGRect(x: imageViewX, y: 0, width: imageWidth, height: imageWidth)
            
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
            
            refreshButton = UIButton()
//            refreshButton.backgroundColor = UIColor.orange
            refreshButton.layer.cornerRadius = 4
            refreshButton.layer.masksToBounds = true
            refreshButton.frame = CGRect(x: screenWidth/2-47, y: messageY, width: 94, height: 35)
//            refreshButton.setTitle("刷新一下", for: .normal)
            refreshButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            refreshButton.addTarget(self, action: #selector(clickRefreshButton), for: .touchUpInside)
            refreshButton.isHidden = true
            
            bgView.addSubview(refreshButton)
        } else {
            print("error: DJEmptyView - image \(imageName ?? "") doesn't exsit.")
        }
    }
}

extension DJEmptyView {
    /// click refresh button
    @objc private func clickRefreshButton() {
        
        if let closure = clickClosure {
            closure()
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
