//
//  ChatViewController.swift
//  Week4Lab
//
//  Created by Hiren Patel on 2/19/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet weak var chatMessageField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func sendMessage(_ sender: Any) {
        
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage.saveInBackground { (success, error) in
            if success {
                self.chatMessageField.text = nil
                self.retrieveMessages()
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
    
    @objc func onTimer() {
        // Add code to be run periodically
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
    }
    
    var currentData: [[String: String]] = []
    var chattingWith = false
    var currentSessionUN = ""
    
    
    func retrieveMessages() {
        let query = PFQuery(className: "Chat")
        query.limit = 1000
        let objects = try! query.findObjects()
        currentData = []
        for i in objects {
            var finalDictionary: [String: String] = [:]
            finalDictionary["username"] = i.object(forKey: "username")! as? String
            finalDictionary["text"] = (i.object(forKey: "text")! as! String)
            if chattingWith {
                if i.object(forKey: "username")! as! String == chatMessageField.text! && i.object(forKey: "to")! as! String == currentSessionUN || i.object(forKey: "username")! as! String == currentSessionUN && i.object(forKey: "to")! as! String == chatMessageField.text! {
                    currentData.append(finalDictionary)
                }
            } else {
                if i.object(forKey: "to")! as! String == "" {
                    currentData.append(finalDictionary)
                }
            }
        }
        tableView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onTimer()
        
        self.tableView.delegate = self as UITableViewDelegate
        // Do any additional setup after loading the view.
    
        self.retrieveMessages()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
