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
        
        let titleAttributes = [NSFontAttributeName: UIFont.navigationTitleFont()]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        self.view.backgroundColor = .white
        
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.black
        
        let leftButton =  UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(triggerLeftButton))
        
//        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(triggerLeftButton))
        
        let rightButton = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.done, target: self, action: nil)
        
//        let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        
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
