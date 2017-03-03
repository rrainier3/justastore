//
//  BlankViewController+Handlers.swift
//  Example
//
//  Created by RayRainier on 3/3/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs

extension BlankViewController {
    
    func setupViews() {
        
        self.view.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
        imageView.image = flyingImage
        
        containerView.addSubview(imageView)
        
        
        // 722x520/2 pixel size applied to heightConstant
        _ = imageView.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 520/2)
        
        containerView.addSubview(lineSeparatorView)
        
        _ = lineSeparatorView.anchor(imageView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        
        productLabel.font = UIFont.cellTitleFont()
        containerView.addSubview(productLabel)
        
        _ = productLabel.anchor(lineSeparatorView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        productSubLabel.font = UIFont.menuTitleFont()
        containerView.addSubview(productSubLabel)
        
        _ = productSubLabel.anchor(productLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 3, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // insert our segmented-control here
        containerView.addSubview(segmentedControl)
        
        _ = segmentedControl.anchor(productSubLabel.bottomAnchor, left: productSubLabel.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 16, leftConstant: 8, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 40)
        
        textView.font = UIFont.menuTitleFont()
        containerView.addSubview(textView)
        
        _ = textView.anchor(segmentedControl.bottomAnchor, left: productSubLabel.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 10, leftConstant: -2, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 0)
        
        containerView.addSubview(addButton)
        
        _ = addButton.anchor(textView.bottomAnchor, left: textView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 20, rightConstant: 12, widthConstant: 0, heightConstant: 50)
    }

    // #selector handle addButton action
    func handleAddButton() {
        print("ORDER Button pressed!")
    }
    
    func setupNavigationButtons() {
        
        self.title = "StoreItem"
        
        let uiFont = UIFont.navigationTitleFont()!
        
        let titleAttributes = [NSFontAttributeName: uiFont as UIFont]
        
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        self.view.backgroundColor = .white
        
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.black
        
        let leftButton =  UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(triggerLeftButton))
        
        let rightButton = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.done, target: self, action: nil)
        
        // barButtonSystemItem styles
        // let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(triggerLeftButton))
        // let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
    }
    
    @objc fileprivate func triggerLeftButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
