//
//  IUserDataSource.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit
///用户数据源
protocol IUserDataSource : NSObjectProtocol {
    
    ///加载用户数据
    func loadUserInfo() -> UserInfoBean
}
