//
//  AppDelegate.swift
//  Focus
//
//  Created by Ogabek Bakhodirov on 27/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let viewController = OverviewViewController()
        viewController.view.backgroundColor = .white
        window?.rootViewController = viewController 
        
        return true
    }
    
    
//    Opens PauseVeiwController when Shortcut activates our app.
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        
        var sourceApp = getSourceApp(from: url)
        if url.scheme == "focus" && url.host() == "pause"
        {
            // Handle the URL
            window?.makeKeyAndVisible()
            let pauseViewController = PauseViewController() // Your custom view controller
            window?.rootViewController = pauseViewController
            
            print(sourceApp)
            return true
        }
        return false
    }
    
    
//    Detect source. From which app our Program is opening.
    func getSourceApp(from url: URL) -> String {
        // Parse the URL and extract the source parameter
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let sourceApp = components?.queryItems?.first(where: { $0.name == "source" })?.value
        print(components, "/")
        return sourceApp ?? "Unknown"
    }
}

