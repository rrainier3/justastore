//
//  BlankViewController.swift
//  Example
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs

class BlankViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.title = "Model Store"
        self.title = "StoreItem"
        
//        let navigationBar = navigationController!.navigationBar
//        navigationBar.tintColor = UIColor.blue
        
        let leftButton =  UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(triggerLeftButton))
        let rightButton = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
		print("BlankViewController ...")
        
    }
    
    @objc fileprivate func triggerLeftButton() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
