//
//  LoginViewController.swift
//  Example
//
//  Created by RayRainier on 4/12/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        button.setTitle("L O G I N", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.titleLabel?.font = UIFont.cellTitleFont()
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.4
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "karekare")
        self.view.addSubview(imageView)
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(loginRegisterButton)
        setupLoginRegisterButton()
    }
    
    func handleLoginButton() {
        print("PRESS THE BUTTON")
    }

    func setupLoginRegisterButton() {
    
    	let width = self.view.bounds.width - 40
    
    	_ = loginRegisterButton.anchor(self.view.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: -140, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 50)
//        // x,y,width, height constraints
//        loginRegisterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        loginRegisterButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 12).isActive = true
//        loginRegisterButton.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
//        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
