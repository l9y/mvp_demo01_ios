//
//  ViewController.swift
//  MVPDemo
//
//  Created by wangzhiyuan on 2018/9/6.
//  Copyright © 2018年 ztstech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IMainView  {

    var mLoading: UIActivityIndicatorView!
    var mTitleLabel: UILabel!
    var mUserTypeLabel: UILabel!
    var mSettingContainer: UIView!
    
    var mCurrentUserInfo: UserInfoBean?
    
    var mPresenter: IMainPresenter!
    
    // MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter(presenter: MainPresenterImpl(view: self))
        initView()
        initData()
    }

    private func initView() {
        mTitleLabel = UILabel(frame: CGRect(x: 0, y: 40, width: 100, height: 20))
        mUserTypeLabel = UILabel(frame: CGRect(x: 0, y: 70, width: 100, height: 20))
        mSettingContainer = UIView(frame: CGRect(x: 0, y: 90, width: self.view.frame.width, height: self.view.frame.height - 60))
        mSettingContainer.backgroundColor = UIColor.yellow
        mLoading = UIActivityIndicatorView(frame: CGRect(x: ((self.view.frame.width) / 2) - 20 , y: ((self.view.frame.height) / 2) - 20, width: 40, height: 40))
        mLoading.isHidden = true
        mLoading.backgroundColor = UIColor.red
        
        self.view.addSubview(mTitleLabel)
        self.view.addSubview(mUserTypeLabel)
        self.view.addSubview(mSettingContainer)
        self.view.addSubview(mLoading)
    }
    
    private func initData() {
        mPresenter.loadUserData()
        mPresenter.loadSettingData()
    }

    
    // MARK: - mvp impl
    
    
    func showLoading(show: Bool) {
        mLoading.isHidden = !show
    }
    
    func showUserData(userData: UserInfoBean) {
        mCurrentUserInfo = userData
        
        mUserTypeLabel.gestureRecognizers?.removeAll()
        mTitleLabel.text = userData.name
        mUserTypeLabel.text = AppUtils.getUserTypeName(userType: userData.currentUserType)
        
        mUserTypeLabel.isUserInteractionEnabled = true
        mUserTypeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onChangeUserTypeClick)))
    }
    
    func showSettingData(settingData: UserSettingInfo) {
        if settingData.badges == nil || settingData.titles == nil {
            fatalError("数据不能为空")
        }
        if settingData.badges.count != settingData.titles.count {
            fatalError("标题与内容长度不一致")
        }
        
        let childs = mSettingContainer.subviews
        for v in childs {
            v.removeFromSuperview()
        }
        
        let count = settingData.badges.count
        
        for i in 0..<count {
            let row : SettingRowView = SettingRowView(frame: CGRect(x: 0.0, y: (CGFloat)(i) * 44.0, width: self.view.frame.width, height: 44.0))
            row.mTitle.text = settingData.titles[i]
            if settingData.badges[i] <= 0 {
                row.mBadge.isHidden = true
            } else {
                row.mBadge.text = "\(settingData.badges[i])"
                row.mBadge.isHidden = false
            }
            mSettingContainer.addSubview(row)
        }
        
    }
    
    func showDialog(msg: String) {
        let alertControler = UIAlertController(title: "注意", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        present(alertControler, animated: true, completion: nil)
    }
    
    func setPresenter(presenter: NSObject) {
        mPresenter = presenter as! IMainPresenter
    }
    
    
    @objc func onChangeUserTypeClick() {
        if let userData = mCurrentUserInfo {
            let alertControler = UIAlertController(title: "切换身份", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
            for userType in userData.userTypes {
                alertControler.addAction(UIAlertAction(title: AppUtils.getUserTypeName(userType: userType), style: UIAlertActionStyle.default, handler: {[weak self] (action) in
                    self?.mPresenter.onUserClickChangeUserType(newType: userType)
                }))
            }
            present(alertControler, animated: true, completion: nil)
        }
    }
}

