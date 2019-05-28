//
//  CommonTabBarVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/23.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class CommonTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = UIColor.white
        
        self.setupViewController()
        
        //方式tabbar上边的图标和文字有偏移动画
        UITabBar.appearance().isTranslucent = false
    }
    
    func setupViewController () {
        
        let titleArr = ["首页","我"]
        
        let normalArr = ["tabbar_discover","tabbar_me"]
        
        let selectedArr = ["tabbar_discoverHL","tabbar_meHL"]
        
        let homeVC = RootViewController()
        
        let myVC = RootMyVC()
        
        let showVCArr = [homeVC,myVC]
        
        let navigationArr = NSMutableArray()
        
        
        for (index, controller) in showVCArr.enumerated() {
            controller.tabBarItem.title = titleArr[index]
            controller.tabBarItem.image = UIImage.init(named: normalArr[index])!.withRenderingMode(.alwaysOriginal)
            controller.tabBarItem.selectedImage = UIImage.init(named: selectedArr[index])!.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: UIControl.State())
        controller.tabBarItem!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
            
            let addNavVC = MHZNavigaitonC.init(rootViewController: controller)
            
            navigationArr.add(addNavVC)
        }
        self.viewControllers = navigationArr.mutableCopy() as! [MHZNavigaitonC]
    }

}
