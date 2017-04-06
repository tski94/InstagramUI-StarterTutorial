//
//  LoginViewController.swift
//  InstagramUI
//
//  Created by Ivor D. Addo on 4/5/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    var loginButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Optional: Place the button in the center of your view.
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self
        if (FBSDKAccessToken.current() != nil) {
            goToNextController()
        }
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User was logged in!")
        goToNextController()
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User was logged out!")
        
    }
    func goToNextController() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarMain")
        self.present(vc!, animated:true, completion:nil)
    }
    
}
