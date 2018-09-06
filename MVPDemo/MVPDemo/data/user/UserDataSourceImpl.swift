//
//  UserDataSourceImpl.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

class UserDataSourceImpl: NSObject, IUserDataSource {

    
    func loadUserInfo() -> UserInfoBean {
        //模拟耗时操作
        Thread.sleep(forTimeInterval: 2)
        let result = UserInfoBean()
        result.name = "二狗子"
        result.currentUserType = UserModelImpl.fakeUserType
        result.userTypes = [UserType.ADMIN, UserType.ORG]
        return result
    }
}
