//
//  MHZNavigaitonC.swift
//  MHZWidget_Swift
//
//  Created by MaHaoZhe on 2019/5/21.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZNavigaitonC: UINavigationController,UINavigationControllerDelegate {
    var popDelegate:UIGestureRecognizerDelegate?
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationBar的背景,字体，字体颜色设置
        self.navigationBar.barTintColor = UIColor.white
//        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor:UIColor.white]
        
        //返回手势
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
        
        
    }
    
    // UIGestureRecognizerDelegate代理
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //实现滑动返回的功能
        //清空滑动返回手势的代理就可以实现
        if viewController == self.viewControllers[0]{
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
        }else{
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
    
    //拦截跳转事件
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            let customBtn = UIButton(frame: CGRect.init(origin: CGPoint.init(x: -20, y: 0), size: CGSize.init(width: 60, height: 44)))
            customBtn.setImage(UIImage(named: "Common_back"), for: .normal)
            customBtn.addTarget(self, action: #selector(navigationBack), for: .touchUpInside)
            customBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            let leftItem = UIBarButtonItem.init(customView: customBtn)
            viewController.navigationItem.leftBarButtonItem = leftItem
        }
        super.pushViewController(viewController, animated: true)
    }
    
    // 返回上一控制器
    @objc private func navigationBack() {
        popViewController(animated: true)
    }
    
}
