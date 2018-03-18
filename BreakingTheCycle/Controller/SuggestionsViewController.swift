//
//  SuggestionsViewController.swift
//  BreakingTheCycle
//
//  Created by MIRCEA COSMIN-IONUT on 18/03/2018.
//  Copyright © 2018 Cosmin. All rights reserved.
//

import UIKit

class SuggestionsViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var buttonView: UIButtonX!
    
     var bottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Get Bottom Constraint for button
        bottomConstraint = NSLayoutConstraint(item: buttonView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(bottomConstraint!)
        
        //MARK: Keyboard notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification), name: .UIKeyboardWillHide , object: nil)
    }

    
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
            let isKeyboardShowing = notification.name == .UIKeyboardWillShow
            bottomConstraint?.constant = isKeyboardShowing ? -keyboardFrame.height : 0
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded() // once changed the constraint above, this will animate the change
            }, completion: { (completed) in
                
            })
        }
        
    }
    
    @IBAction func moveToNextScreen(_ sender: Any) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "moveToNextScreen" {
            let controller = segue.destination as! PlanSavingsTableViewController
            controller.target = amountTextField.text!

        }
    }
    
    
}
