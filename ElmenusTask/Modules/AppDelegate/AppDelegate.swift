//
//  AppDelegate.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/23/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var navigationController: UINavigationController? = nil



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureRootController()
        return true
    }
    
    
    //MARK:- Setup Root Controller
    private func configureRootController() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        navigationController = UINavigationController()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        let tagsVC = TagsRouter.assembleModule()
        navigationController?.viewControllers = [tagsVC]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func applicationWillResignActive(_ application: UIApplication) {
    
    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}

