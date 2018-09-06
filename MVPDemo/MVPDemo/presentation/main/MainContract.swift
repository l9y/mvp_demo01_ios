//
//  MainContract.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

protocol IMainView : BaseMVPView {
    
    ///show loading
    func showLoading(show: Bool)
    
    ///显示用户数据
    func showUserData(userData: UserInfoBean)
    
    ///显示用户设置信息
    func showSettingData(settingData: UserSettingInfo)
    
    ///显示对话框
    func showDialog(msg: String)
    
}

protocol IMainPresenter : NSObjectProtocol {
    
    ///加载用户数据
    func loadUserData()
    
    ///加载用户设置数据
    func loadSettingData()
    
    ///用户点击更换用户类型
    func onUserClickChangeUserType(newType: Int)
    
}
