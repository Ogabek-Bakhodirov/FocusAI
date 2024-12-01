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
        
        NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(handleOpenFocusAppURL),
                    name: .openFocusAppURL,
                    object: nil
                )
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let viewController = OverviewViewController()
        viewController.view.backgroundColor = .white
        window?.rootViewController = viewController 
        
        return true
    }
    
    @objc private func handleOpenFocusAppURL() {
            DispatchQueue.main.async {
                // Ensure app is in the foreground before opening the URL
                if UIApplication.shared.applicationState == .background {
                    // Bring the app to the foreground
                    UIApplication.shared.applicationState == .active
                }

                if let url = URL(string: "focus://pause") {
                    // Open the URL
                    DispatchQueue.main.async {
                        UIApplication.shared.open(url, options: [:], completionHandler: { success in
                            print(success ? "URL opened successfully" : "Failed to open URL")
                        })
                    }
                } else {
                    print("Invalid URL")
                }
            }
        }
    
    
//    Opens PauseVeiwController when Shortcut activates our app.
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return checkIfFocusAIShouldActivate(app: app, open: url)
    }
    


    func openApp(url: String) {
        
        if let youtubeURL = URL(string: "youtube://") {
            if UIApplication.shared.canOpenURL(youtubeURL) {
                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: { _ in
                    // Reset flag after opening the app
                })
            } 
//            else 
//            {
//                // Fallback to opening YouTube in Safari if app is not installed
//                if let youtubeWebURL = URL(string: "https://www.youtube.com") {
//                    UIApplication.shared.open(youtubeWebURL, options: [:], completionHandler: { _ in
//                        // Reset flag after opening the app
//                        self.resetAppOpeningFlag()
//                    })
//                }
//            }
        }
    }
    
    func checkIfFocusAIShouldActivate(app: UIApplication, open url: URL) -> Bool{
        // Check if the flag is set to true (FocusAI is currently opening an app)
        let isOpeningApp = UserDefaults.standard.bool(forKey: "isOpeningApp")
        
        if isOpeningApp {
            // If the flag is true, prevent FocusAI from activating
            print("FocusAI is already opening another app. Shortcut will not trigger. ////....,,,,.>>")
            return false
        }
        
        // Proceed with the regular FocusAI process if the flag is false
        return activateFocusAI(app: app, open: url)
    }

    func activateFocusAI(app: UIApplication, open url: URL) -> Bool{
        if url.scheme == "focus" && url.host == "pause"
        {
            // Handle the URL
            window?.makeKeyAndVisible()
            let pauseViewController = PauseViewController() // Your custom view controller
            window?.rootViewController = pauseViewController
            return true
        }
        return false
    }



}



extension Notification.Name {
    static let openFocusAppURL = Notification.Name("openFocusAppURL")
}
