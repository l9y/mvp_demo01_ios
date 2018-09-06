//
//  SettingRowView.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

class SettingRowView: UIView {

    var mTitle: UILabel!
    var mBadge: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func initView() {
        mTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width - 44, height: 44))
        mBadge = UILabel(frame: CGRect(x: self.frame.width - 44, y: 0, width: 44, height: 44))
        mBadge.backgroundColor = UIColor.red
        mBadge.textColor = UIColor.white
        
        addSubview(mTitle)
        addSubview(mBadge)
    }
    
    
    
}
