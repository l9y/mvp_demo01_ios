//
//  SettingModelImpl.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

class SettingModelImpl: NSObject, ISettingModel {

    func loadSettingData(onSucceed: ((UserSettingInfo) -> ())?, onFailed: ((String) -> ())?) {
        UserModelImpl.sInstance.loadUserData(onSucceed: {[weak self] (userInfo) in
            if let _self = self {
                if UserType.ADMIN == userInfo.currentUserType {
                    onSucceed?(_self.loadAdminSetting())
                } else if UserType.ORG == userInfo.currentUserType {
                    onSucceed?(_self.loadOrgSetting())
                } else if UserType.NORMAL == userInfo.currentUserType {
                    onSucceed?(_self.loadNormalSetting())
                } else {
                    fatalError("未知用户类型：\(userInfo.currentUserType)")
                }
            }
        }, onFailed: onFailed)
    }
    
    ///加载管理员条目
    private func loadAdminSetting() -> UserSettingInfo {
        let result = UserSettingInfo()
        result.badges = [0, 1]
        result.titles = ["管理员条目1", "管理员条目2"]
        return result
    }
    
    ///加载机构条目
    private func loadOrgSetting() -> UserSettingInfo {
        let result = UserSettingInfo()
        result.badges = [0, 2, 0]
        result.titles = ["机构条目1", "机构条目2", "机构条目3"]
        return result
    }
    
    ///加载机构条目
    private func loadNormalSetting() -> UserSettingInfo {
        let result = UserSettingInfo()
        result.badges = [0, 0, 2]
        result.titles = ["普通条目1", "普通条目2", "普通条目3"]
        return result
    }
}
