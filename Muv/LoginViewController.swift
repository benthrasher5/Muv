//
//  LoginViewController.swift
//  Muv
//
//  Created by Ben on 10/3/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameInputField: UITextField!
    @IBOutlet weak var passwordInputField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookLoginButtonContainer: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)

//        let preferences = UserDefaults.standard
//        if let session = preferences.object(forKey: "session") as? String
//        {
//            AuthService.checkSessionAndLogin(with: session, callback: self.loginSuccessful)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
 }
    
    //MARK: functions
    func loginSuccessful() {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    //MARK: Actions
    @IBAction func loginButtonPressed(_ sender: Any) {
        AuthService.login(username:usernameInputField.text!, password: passwordInputField.text!, callback: self.loginSuccessful)
    }
    
    @IBAction func passwordFieldGoPressed(_ sender: Any) {
        AuthService.login(username:usernameInputField.text!, password: passwordInputField.text!, callback: self.loginSuccessful)
    }
}
