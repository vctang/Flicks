//
//  AppDelegate.swift
//  movie-browser
//
//  Created by Vicky Tang on 1/31/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Navigation Bar Color
        UINavigationBar.appearance().barTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor(red: 243/255, green: 203/255, blue: 73/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 243/255, green: 203/255, blue: 73/255, alpha: 1)]
        
        // Status Bar Color
        application.statusBarStyle = .lightContent
        
        //Search Bar Color
        //UISearchBar.appearance().backgroundColor = UIColor.black
        //UISearchBar.appearance().tintColor = UIColor(red: 243/255, green: 203/255, blue: 73/255, alpha: 1)
        
        // set up your background color view
        let colorView = UIView()
        colorView.backgroundColor = UIColor(red: 243/255, green: 203/255, blue: 73/255, alpha: 1)
        
        // use UITableViewCell.appearance() to configure
        // the default appearance of all UITableViewCells in your app
        UITableViewCell.appearance().selectedBackgroundView = colorView
        
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nowPlayingNavigationController = storyboard.instantiateViewController(withIdentifier: "MoviesNavigationController") as! UINavigationController
        let nowPlayingViewController = nowPlayingNavigationController.topViewController as! MoviesViewController
        nowPlayingViewController.endpoint = "now_playing"
        nowPlayingNavigationController.tabBarController?.tabBarItem.title = "Now Playing"
        nowPlayingNavigationController.tabBarItem.image = UIImage(named: "now_playing")
        nowPlayingNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        let topRatedNavigationController = storyboard.instantiateViewController(withIdentifier: "MoviesNavigationController") as! UINavigationController
        let topRatedViewController = topRatedNavigationController.topViewController as! MoviesViewController
        topRatedViewController.endpoint = "top_rated"
        topRatedNavigationController.tabBarController?.tabBarItem.title = "Top Rated"
        topRatedNavigationController.tabBarItem.image = UIImage(named: "top_rated")
        topRatedNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        // Tab Bar Controller Color
        let tabBarController = UITabBarController()
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().tintColor = UIColor(red: 243/255, green: 203/255, blue: 73/255, alpha: 1)
        tabBarController.viewControllers = [nowPlayingNavigationController, topRatedNavigationController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
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

