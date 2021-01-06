//  Copyright © 2020 VenueNext. All rights reserved.

import UIKit
import VNWebSDK

class VenueNextAppDelegate: NSObject, UIApplicationDelegate, VNThemable {
    
    var navigationBarBackground: UIColor = UIColor.blue
    var accent: UIColor = UIColor.yellow
    var backString: String = "Back"
    var closeString: String = "Close"
    
    public static let shared = VenueNextAppDelegate()
    
    lazy var rootViewController: UIViewController? = {
        return (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController
    }()
    
    public func applicationDidFinishLaunching(_ application: UIApplication) {
        VenueNextWeb.shared.initialize("example")

        VenueNextWeb.shared.configureTheme(self)
        VenueNextWeb.shared.configureBrainTree(VNBraintree())
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let presenter = rootViewController else {
            return false
        }
        
        let canHandle = VenueNextWeb.canHandle(url: url)
        
        if canHandle {
            VenueNextWeb.handle(url: url, presenter: presenter, completion: nil)
        }
        
        return canHandle
    }
}
