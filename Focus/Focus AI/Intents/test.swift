//
//  test.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 01/12/24.
//

import UIKit

class FocusAIViewController: UIViewController {
    
    // Example: List of available apps
    let appOptions = ["Instagram", "YouTube", "TikTok", "Twitter"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize your UI (e.g., a button or a label)
        setupUI()
    }
    
    func setupUI() {
        // Add a button or interactive element to trigger the menu
        let appSelectionButton = UIButton(type: .system)
        appSelectionButton.setTitle("Select an App", for: .normal)
        appSelectionButton.addTarget(self, action: #selector(showAppSelection), for: .touchUpInside)
        
        // Add the button to the view (example)
        view.addSubview(appSelectionButton)
        appSelectionButton.center = view.center
    }
    
    @objc func showAppSelection() {
        // Show an action sheet or another form of menu
        let alertController = UIAlertController(title: "Select an App", message: nil, preferredStyle: .actionSheet)
        
        for app in appOptions {
            alertController.addAction(UIAlertAction(title: app, style: .default, handler: { [weak self] _ in
                self?.appSelected(app)
            }))
        }
        
        // Show the action sheet
        present(alertController, animated: true)
    }
    
    func appSelected(_ appName: String) {
        // Handle the app selection (e.g., open Instagram, YouTube, etc.)
        switch appName {
        case "Instagram":
            openInstagram()
        case "YouTube":
            openYouTube()
        case "TikTok":
            openTikTok()
        default:
            break
        }
    }
    
    func openInstagram() {
        if let url = URL(string: "instagram://") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func openYouTube() {
        if let url = URL(string: "youtube://") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func openTikTok() {
        if let url = URL(string: "tiktok://") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
