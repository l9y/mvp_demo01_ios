//
//  MainPresenterImpl.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

class MainPresenterImpl: NSObject, IMainPresenter {
    
    private weak var mView: IMainView!
    
    ///加载中状态
    private var mInfoLoading = false
    private var mSettingLoading = false
    
    private let settingModel : ISettingModel = SettingModelImpl() //在这里引用不被释放
    
    init(view: IMainView) {
        super.init()
        self.mView = view
    }
    
    func loadUserData() {
        if mInfoLoading {
            debugPrint("正在加载用户信息，取消此次加载")
            return
        }
        mInfoLoading = true
        updateViewLoading()
        UserModelImpl.sInstance.loadUserData(onSucceed: {[weak self] (userInfo) in
            self?.mView.showUserData(userData: userInfo)
            self?.mInfoLoading = false
            self?.updateViewLoading()
        }) {[weak self] (errMsg) in
            self?.mView?.showDialog(msg: errMsg)
            self?.mInfoLoading = false
            self?.updateViewLoading()
        }
    }
    
    func loadSettingData() {
        if mSettingLoading {
            debugPrint("正在加载设置信息，取消此次加载")
            return
        }
        mSettingLoading = true
        updateViewLoading()
        settingModel.loadSettingData(onSucceed: {[weak self] (settingInfo) in
            self?.mView.showSettingData(settingData: settingInfo)
            self?.mSettingLoading = false
            self?.updateViewLoading()
        }) {[weak self] (errmsg) in
            self?.mView.showDialog(msg: errmsg)
            self?.mSettingLoading = false
            self?.updateViewLoading()
        }
    }
    
    func onUserClickChangeUserType(newType: Int) {
        self.mView.showLoading(show: true)
        UserModelImpl.sInstance.changeUserType(newType: newType, onSucceed: {[weak self] in
            self?.loadUserData()
            self?.loadSettingData()
        }) {[weak self] (errmsg) in
            self?.mView.showDialog(msg: errmsg)
            self?.mView.showLoading(show: false)
        }
    }
    
    
    private func updateViewLoading() {
        mView?.showLoading(show: mSettingLoading || mInfoLoading)
    }
    
    

}
