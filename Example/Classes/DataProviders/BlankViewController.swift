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
        
		print("BlankViewController ...")
        
    }
    
    let containerView: UIView = {
        let cv = UIView()
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
        
        let thisCV = containerView
        thisCV.addSubview(imageView)
        thisCV.addSubview(textView)
        thisCV.addSubview(lineSeparatorView)
        
        thisCV.anchor(thisCV.topAnchor, left: thisCV.leftAnchor, bottom: thisCV.bottomAnchor, right: thisCV.rightAnchor, topConstant: 32, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        imageView.anchorToTop(thisCV.topAnchor, left: thisCV.leftAnchor, bottom: textView.topAnchor, right: thisCV.rightAnchor)
        
        textView.anchorWithConstantsToTop(nil, left: thisCV.leftAnchor, bottom: thisCV.bottomAnchor, right: thisCV.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        textView.heightAnchor.constraint(equalTo: thisCV.heightAnchor, multiplier: 0.3).isActive = true
        
        lineSeparatorView.anchorToTop(nil, left: thisCV.leftAnchor, bottom: textView.topAnchor, right: thisCV.rightAnchor)
        
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
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
