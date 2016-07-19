//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    private var currentTextField: UITextField?
    var email: String?
    var emailConfirm: String?
    var phone: String?
    var password: String?
    var passwordConfirm: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.enabled = false
        
        emailTextField.delegate = self
        emailTextField.tag = 1
        emailConfirmationTextField.delegate = self
        emailConfirmationTextField.tag = 2
        phoneTextField.delegate = self
        phoneTextField.tag = 3
        passwordTextField.delegate = self
        passwordTextField.tag = 4
        passwordConfirmTextField.delegate = self
        passwordConfirmTextField.tag = 5
        
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        currentTextField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        switch textField.tag {
        case 1:
            self.email = textField.text!
        case 2:
            self.emailConfirm = textField.text!
        case 3:
            self.phone = textField.text!
        case 4:
            self.password = textField.text!
        case 5:
            self.passwordConfirm = textField.text!
        default:
            self.email = "None"
            self.emailConfirm = "None"
            self.phone = "None"
            self.password = "None"
            self.passwordConfirm = "None"
        }
    }
    
    func validEmail() -> Bool {
        if self.email == self.emailConfirm {
            return true
        }
        return false
    }
    
    func validPassword() -> Bool {
        if self.password == self.passwordConfirm {
            return true
        }
        return false
    }
    
    func validPhone() -> Bool {
        return false 
    }

}