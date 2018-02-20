//
//  ChatViewController.swift
//  Week4Lab
//
//  Created by Hiren Patel on 2/19/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {
    
    @IBOutlet weak var chatMessageField: UITextField!
    
    
    @IBAction func sendMessage(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
            }
            else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
