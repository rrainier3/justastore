//
//  ExampleTableViewCell.swift
//  ColorMatchTabs
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var contentImageView: UIImageView!

    func apply(_ image: UIImage) {
    
        contentImageView.image = image
        
        setupImageForGesture(contentView: contentImageView)
    }

    fileprivate func setupImageForGesture(contentView: UIImageView) {
    
        let imageView = contentView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectImage)))
        imageView.isUserInteractionEnabled = true
        
    }
    
    @objc fileprivate func handleSelectImage() {
        
            print("Selected contentImageView in UITableViewCell")
    }
    

}
