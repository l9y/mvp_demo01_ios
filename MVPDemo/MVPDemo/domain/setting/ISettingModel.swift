//
//  ISettingModel.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

protocol ISettingModel: NSObjectProtocol {
    
    ///加载用户设置信息
    func loadSettingData(onSucceed: ((UserSettingInfo) -> ())?, onFailed: ((String) -> ())?)

}
