//
//  LoginViewController.swift
//  Example
//
//  Created by RayRainier on 4/7/17.
//  Copyright © 2017 Yalantis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "karekare")
        self.view.addSubview(imageView)

		self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
