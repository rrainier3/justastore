//
//  LoginViewController.swift
//  Example
//
//  Created by RayRainier on 4/12/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController, UITextFieldDelegate {

    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        //button.backgroundColor = UIColor.clear
        
        button.setTitle("L O G I N", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .normal)
        
        button.titleLabel?.font = UIFont.cellTitleFont()
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.7).cgColor
        button.layer.borderWidth = 1.4
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true

        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "blue_sprite")
        self.view.addSubview(imageView)
        
		// EmailTextField
        setupEmailTextField()

		// LoginRegisterButton
        setupLoginRegisterButton()
    }
    
    func handleLoginButton() {
        print("PRESS THE BUTTON")
    }

    func setupLoginRegisterButton() {
    
    	let width = self.view.bounds.width - 60

        self.view.addSubview(loginRegisterButton)
    	_ = loginRegisterButton.anchor(self.view.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: -140, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 50)

    }
    
    func setupEmailTextField() {
        
        let width = self.view.bounds.width - 60
        
        let emailTextField = SkyFloatingLabelTextField(frame: CGRect(x: 10, y: 10, width: 200, height: 45))
        emailTextField.placeholder = "Email Address"
        emailTextField.title = "Email Address"
    	emailTextField.titleColor = .white
        emailTextField.errorColor = UIColor.orange
        emailTextField.delegate = self
        
        emailTextField.selectedTitle = "Email Address"
        emailTextField.selectedTitleColor = .white
        emailTextField.selectedLineColor = .white
        emailTextField.font = UIFont.fontAvenirMedium(ofSize: 18)
        
        emailTextField.textColor = .white
        
        self.view.addSubview(emailTextField)
        
        _ = emailTextField.anchor(self.view.centerYAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 60)
    }
    
    func setupPasswordField() {
        
        let width = self.view.bounds.width - 60
        
        let passwordField = SkyFloatingLabelTextField(frame: CGRect(x: 10, y: 10, width: 200, height: 45))
        passwordField.placeholder = "Password"
        passwordField.title = "Password"
        passwordField.titleColor = .white
        passwordField.errorColor = UIColor.orange
        passwordField.delegate = self
        
        passwordField.selectedTitle = "Password"
        passwordField.selectedTitleColor = .white
        passwordField.selectedLineColor = .white
        passwordField.font = UIFont.fontAvenirMedium(ofSize: 18)
        
        passwordField.textColor = .white
        passwordField.isSecureTextEntry = true
        
        self.view.addSubview(passwordField)
        
        _ = passwordField.anchor(self.view.centerYAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 60)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Implementing a method on the UITextFieldDelegate protocol. This will notify us when something has changed on the textfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            
            if let floatingLabelTextField = textField as? SkyFloatingLabelTextField {
                
                if(text.characters.count < 3 || !isValidEmailAddress(emailAddressString: text)) {
                    
                    // if(text.characters.count < 3 || !text.contains("@")) {
                    
                    floatingLabelTextField.errorMessage = "Invalid email"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
            }
        }
        return true
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }

}
