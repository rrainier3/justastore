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
    
    let segmentedControl: TTSegmentedControl = {
        let segmentedControl = TTSegmentedControl()
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        // segmentedControl 3 type
        segmentedControl.itemTitles = ["S","M","L"]
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.selectedTextFont = UIFont.systemFont(ofSize: 16, weight: 0.3)
        segmentedControl.defaultTextFont = UIFont.systemFont(ofSize: 16, weight: 0.01)
        segmentedControl.useGradient = true
        segmentedControl.useShadow = true
        segmentedControl.thumbShadowColor = TTSegmentedControl.UIColorFromRGB(0x22C6E7)
        segmentedControl.thumbGradientColors = [ TTSegmentedControl.UIColorFromRGB(0x25D0EC), TTSegmentedControl.UIColorFromRGB(0x1EA3D8)]
        
        segmentedControl.didSelectItemWith = { (index, title) -> () in
            		print("Selected item \(index) for \(title)")
    		}
        return segmentedControl
    }()
    
    let containerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
		cv.translatesAutoresizingMaskIntoConstraints = false
        cv.layer.masksToBounds = true
        return cv
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "ocean")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    let productLabel: UILabel = {
        let label = UILabel()
        label.text = "Ultimate Product"
        label.textAlignment = .left
        label.numberOfLines = 0 	// this causes text to wrap-around
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 13/255, green: 187/255, blue: 243/255, alpha: 1)
        return label
    }()
    
    let productSubLabel: UILabel = {
        let label = UILabel()
        label.text = "Advanced Formula Nutrition"
        label.textAlignment = .left
        label.numberOfLines = 0 	
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        return label
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        tv.isEditable = false
        tv.textAlignment = .justified
        //tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        tv.textColor = UIColor(red: 95/255, green: 100/255, blue: 100/255, alpha: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        
        tv.isHidden = false
        
        // Let us style the linespacing CGFloat in this paragraph
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 8
        let attributes = [NSParagraphStyleAttributeName: style]
        tv.attributedText = NSAttributedString(string: tv.text, attributes: attributes)
        return tv
    }()

    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 7/255, green: 184/255, blue: 248/255, alpha: 1)
        button.setTitle("O R D E R", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.titleLabel?.font = UIFont.cellTitleFont()
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
        
        return button
    }()
    
    // #selector handle addButton action
    func handleAddButton() {
        
    }
    
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
