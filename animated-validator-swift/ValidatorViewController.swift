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
            if !self.validEmail() {
                animatedValidator(textField)
            }
        case 2:
            self.emailConfirm = textField.text!
            if !self.validEmailConfirm() {
                animatedValidator(textField)
            }
        case 3:
            self.phone = textField.text!
            if !self.validPhone() {
                animatedValidator(textField)
            }
        case 4:
            self.password = textField.text!
            if !self.validPassword() {
                animatedValidator(textField)
            }
        case 5:
            self.passwordConfirm = textField.text!
            if !self.validPasswordConfirm() {
                animatedValidator(textField)
            } else if self.validPasswordConfirm() {
                self.submitButton.enabled = true
            }
        default:
            self.email = "None"
            self.emailConfirm = "None"
            self.phone = "None"
            self.password = "None"
            self.passwordConfirm = "None"
        }
    }
    
    func validEmail() -> Bool {
        let emailValidators = [".", "@"]
        if let emailString = email {
            for character in emailString.characters {
                if emailValidators.contains(String(character)) {
                    return true
                }
            }
        }
        return false
    }
    
    func validEmailConfirm() -> Bool {
        if let confirmedEmail = self.emailConfirm {
            if confirmedEmail == self.email && self.validEmail() {
                return true
            }
        }
        return false
    }
    
    func validPassword() -> Bool {
        if let passwordValid = self.password {
            if passwordValid.length >= 7 {
                return true
            }
        }
        return false
    }
    
    func validPhone() -> Bool {
        if let phoneString = self.phone {
            if phoneString.length >= 6 {
                return true
            }
            
        }
        return false 
    }
    
    
    func validPhoneNumber() -> Bool {
        if let phoneNumber = self.phone {
            if phoneNumber.length  == 7 {
                return true
            }
        }
        return false
    }
    
    func validPasswordConfirm() -> Bool {
        if let confirmedPassword = self.passwordConfirm {
            if confirmedPassword == self.password && self.validPassword(){
                return true
            }
        }
        return false
    }

    
    func animatedValidator(textfield: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(textfield.center.x - 10, textfield.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(textfield.center.x + 10, textfield.center.y))
        textfield.layer.addAnimation(animation, forKey: "position")
    }

}