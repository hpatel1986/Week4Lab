//
//  LoginViewController.swift
//  Week4Lab
//
//  Created by Hiren Patel on 2/19/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordFIeld: UITextField!
    
    @IBAction func onSIgnIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordFIeld.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("you're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else {
                self.onAlertTapped(AnyObject.self)
            }
        }
    }
    
    @IBAction func onAlertTapped(_ sender: Any){
        if ((usernameField.text?.isEmpty)! || (passwordFIeld.text?.isEmpty)!) {
            let alertController = UIAlertController(title: "Error", message: "Username and Password missing", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }

        }
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordFIeld.text
        
        newUser.signUpInBackground { (success: Bool,error: Error?) in
            if success {
                print("created user")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            }else {
                print(error?.localizedDescription as Any)
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
