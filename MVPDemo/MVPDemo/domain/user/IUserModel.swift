//
//  IUserModel.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

protocol IUserModel: NSObjectProtocol {

    ///更新用户类型
    func changeUserType(newType: Int, onSucceed: (() -> ())?, onFailed: ((String) -> ())?)
    
    ///加载用户数据
    func loadUserData(onSucceed: ((UserInfoBean) -> ())?, onFailed: ((String) -> ())?)
    
    
}
