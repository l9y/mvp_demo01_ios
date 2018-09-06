//
//  AppUtils.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

class AppUtils: NSObject {

    public static func getUserTypeName(userType: Int) -> String {
        switch userType {
        case UserType.ADMIN:
            return "管理员"
        case UserType.ORG:
            return "机构用户"
        case UserType.NORMAL:
            return "普通用户"
        default:
            fatalError("未知用户类型：\(userType)")
        }
    }
}
