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
        

        UINavigationBar.appearance().barTintColor = .white

        // How to set backgroundImage of navBar
//        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "bluegreen")!.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0)), for: .default)
        
        setupNavigationButtons()
        
        setupViews()
                
    }
    

	// How to change navBar height
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        let height: CGFloat = 50 //whatever height you want
//        
//        let bounds = self.navigationController!.navigationBar.bounds
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
//    }
    
    
    let segmentedControl: TTSegmentedControl = {
        let segmentedControl = TTSegmentedControl()
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        // segmentedControl 3 type
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.selectedTextFont = UIFont.systemFont(ofSize: 16, weight: 0.3)
        segmentedControl.defaultTextFont = UIFont.systemFont(ofSize: 16, weight: 0.01)
        segmentedControl.useGradient = true
        segmentedControl.useShadow = true
        segmentedControl.thumbShadowColor = TTSegmentedControl.UIColorFromRGB(0x22C6E7)
        //segmentedControl.thumbGradientColors = [ TTSegmentedControl.UIColorFromRGB(0x25D0EC), TTSegmentedControl.UIColorFromRGB(0x1EA3D8)]
        segmentedControl.thumbGradientColors = [refTintColor, refTintColor]
        
        return segmentedControl
        
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$19.95"
        label.textAlignment = .left
        label.numberOfLines = 0 	// this causes text to wrap-around
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.textColor = UIColor.fromRGB(0xf4ac06)
        label.textColor = UIColor(red: 1.00, green: 0.61, blue: 0.16, alpha: 1.00)
        return label
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
        //label.textColor = UIColor(red: 13/255, green: 187/255, blue: 243/255, alpha: 1)
        label.textColor = UIColor.darkGray
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
        //button.backgroundColor = UIColor(red: 7/255, green: 184/255, blue: 248/255, alpha: 1)
        
        button.backgroundColor = refTintColor
        
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
    
    let giBadgeView: GIBadgeView = {
        let badge = GIBadgeView()
        badge.topOffset = 6
        badge.rightOffset = 24
        return badge
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
