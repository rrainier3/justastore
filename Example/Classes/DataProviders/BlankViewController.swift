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
        
        setupNavigationButtons()
        
        setupViews()
                
    }
    
    
    let containerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .green
		cv.translatesAutoresizingMaskIntoConstraints = false
        cv.layer.masksToBounds = true
        return cv
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "ocean")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "MOUNTAIN DEW AT THE ALPS"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    func setupViews() {
    
    	self.view.addSubview(containerView)

		containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
        //containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -8).isActive = true
        //containerView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true

        imageView.image = flyingImage
        
        containerView.addSubview(imageView)
        
        _ = imageView.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: view.frame.height/2)

//        textView.anchorWithConstantsToTop(nil, left: thisCV.leftAnchor, bottom: thisCV.bottomAnchor, right: thisCV.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
//        
//        textView.heightAnchor.constraint(equalTo: thisCV.heightAnchor, multiplier: 0.3).isActive = true
//        
//        lineSeparatorView.anchorToTop(nil, left: thisCV.leftAnchor, bottom: textView.topAnchor, right: thisCV.rightAnchor)
//        
//        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    fileprivate func setupNavigationButtons() {
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
