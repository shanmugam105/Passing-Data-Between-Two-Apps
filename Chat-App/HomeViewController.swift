//
//  HomeViewController.swift
//  Chat-App
//
//  Created by Sparkout on 05/01/23.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let urlString = AppConstants.authAppScheme + "://" + AppConstants.chatAppScheme + "?action=auth"
        if let authUrlScheme = URL(string: urlString) {
            UIApplication.shared.open(authUrlScheme)
        }
    }
    
    private func configureView() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loggedIn),
                                               name: Notification.loggedIn,
                                               object: nil)
    }
    
    @objc private func loggedIn(_ sender: Notification) {
        infoLabel.text = "Welcome!"
        loginButton.isHidden = true
    }
}
