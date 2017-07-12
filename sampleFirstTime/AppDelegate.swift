//
//  AppDelegate.swift
//  sampleFirstTime
//
//  Created by Eriko Ichinohe on 2017/07/12.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        // 参考
        // http://qiita.com/KIKUMA/items/8254ff209890393c708b
        
        //ユーザーデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データを読みだして
        let myStr = myDefault.string(forKey: "FirstFlag")
        
        //文字列が入ってたらSecondViewControllerを表示（2回目以降）
        if let tmpStr = myStr{
            self.window = UIWindow(frame: UIScreen.main.bounds)
            //Storyboardを指定
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let sc:SecondViewController = storyboard.instantiateViewController(withIdentifier: "Second")
                as! SecondViewController
            
            //rootViewControllerに入れる
            self.window?.rootViewController = sc
            
        }else{
            // 文字が入ってなかったら初回起動時なので、FirstFlagに値を入れる
            myDefault.set("ON", forKey: "FirstFlag")
            myDefault.synchronize()
            
            //ストーリボードの設定のままViewControllerが表示される
            
        }

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

