//
//  UserInfoBean.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

///用户信息
class UserInfoBean: NSObject {
    
    ///用户名
    var name: String!
    
    ///用户当前身份
    var currentUserType: Int!
    
    ///用户所有身份
    var userTypes: [Int]!

}
