/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    The application delegate.
*/

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {
    // MARK: Properties
    
    var window: UIWindow?
    
    var appController: TVApplicationController?
    
    static let TVBaseURL = "http://localhost:9001/"
    
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"

    // MARK: UIApplication Overrides
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        /*
            Create the TVApplicationControllerContext for this application
            and set the properties that will be passed to the `App.onLaunch` function
            in JavaScript.
        */
        let appControllerContext = TVApplicationControllerContext()
        
        /*
            The JavaScript URL is used to create the JavaScript context for your
            TVMLKit application. Although it is possible to separate your JavaScript
            into separate files, to help reduce the launch time of your application
            we recommend creating minified and compressed version of this resource.
            This will allow for the resource to be retrieved and UI presented to
            the user quickly.
        */
        if let javaScriptURL = URL(string: AppDelegate.TVBootURL) {
            appControllerContext.javaScriptApplicationURL = javaScriptURL
        }
        
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        if let launchOptions = launchOptions {
            for (kind, value) in launchOptions {
                appControllerContext.launchOptions[kind.rawValue] = value
            }
        }

        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        
        return true
    }
    
    // MARK: TVApplicationControllerDelegate
    
    func appController(_ appController: TVApplicationController, didFinishLaunching options: [String: Any]?) {
        print("\(#function) invoked with options: \(String(describing: options))")
    }
    
    func appController(_ appController: TVApplicationController, didFail error: Error) {
        print("\(#function) invoked with error: \(error)")
    }
    
    func appController(_ appController: TVApplicationController, didStop options: [String: Any]?) {
        print("\(#function) invoked with options: \(String(describing: options))")
    }
}
