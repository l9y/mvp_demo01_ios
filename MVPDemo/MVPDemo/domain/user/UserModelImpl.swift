//
//  UserModelImpl.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

class UserModelImpl: NSObject, IUserModel {

    ///假数据
    static var fakeUserType: Int = UserType.ADMIN
    
    static let sInstance : IUserModel = UserModelImpl()
    
    private override init() {
        super.init()
    }
    
    func changeUserType(newType: Int, onSucceed: (() -> ())?, onFailed: ((String) -> ())?) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 2)
            UserModelImpl.fakeUserType = newType
            DispatchQueue.main.async {
                onSucceed?()
            }
        }
    }
    
    func loadUserData(onSucceed: ((UserInfoBean) -> ())?, onFailed: ((String) -> ())?) {
        DispatchQueue.global().async {
            let result = UserDataSourceImpl().loadUserInfo()
            DispatchQueue.main.async {
                onSucceed?(result)
            }
        }
    }
    
}
