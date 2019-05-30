//
//  AppDelegate.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/3/25.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var shortcutItemToProcess: UIApplicationShortcutItem?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.frame = CGRect.init(origin: UIScreen.main.bounds.origin, size: UIScreen.main.bounds.size)
        self.window?.backgroundColor = UIColor.white
        
        self.window?.rootViewController = CommonTabBarVC()
        self.window?.makeKeyAndVisible()
        
        if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
                shortcutItemToProcess = shortcutItem
            }
        
        
        return true
    }
    
    //MARK: 添加3D Touch items
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        shortcutItemToProcess = shortcutItem
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        // 快速访问的按钮只能添加4个，包含代码添加的和配置文件配置的
        application.shortcutItems = [UIApplicationShortcutItem(type: "FavoriteAction", localizedTitle: "喜欢", localizedSubtitle: "最喜欢的事情", icon: UIApplicationShortcutIcon(type: .love), userInfo: ["name":"MHZ" as NSSecureCoding]),UIApplicationShortcutItem(type: "discoverAction", localizedTitle: "发现", localizedSubtitle: "发现身边事", icon: UIApplicationShortcutIcon(templateImageName: "tabbar_discover"), userInfo: ["name":"MHZ" as NSSecureCoding])]
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        switch shortcutItemToProcess?.type {
        case "FavoriteAction":
            print("喜欢")
        case "SearchAction":
            print("分享")
        case "contactAction":
            print("联系人")
        case "discoverAction":
            print("发现")
        default:
            break
            
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

