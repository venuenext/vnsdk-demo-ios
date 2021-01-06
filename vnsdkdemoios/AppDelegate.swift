//  Copyright © 2020 VenueNext. All rights reserved.

import UIKit
import VNWebSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        VenueNextAppDelegate.shared.applicationDidFinishLaunching(application)
                                
        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = UINavigationController(rootViewController: DemoTableViewController())
        window?.makeKeyAndVisible()
                        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return VenueNextAppDelegate.shared.application(app, open: url, options: options)
    }
}

