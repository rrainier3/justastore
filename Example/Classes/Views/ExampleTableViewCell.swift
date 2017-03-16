//
//  ExampleTableViewCell.swift
//  ColorMatchTabs
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

protocol ChangeViewProtocol: NSObjectProtocol {
    func loadNewScreen(controller: UIViewController) -> Void
}

class ExampleTableViewCell: UITableViewCell {

	var delegate: ChangeViewProtocol?
    var product: Product?
    
    @IBOutlet fileprivate weak var contentImageView: UIImageView!

    func apply(_ image: UIImage) {
    
        contentImageView.image = image
        
        setupImageForGesture(contentView: contentImageView)
        
    }
    
    func applyProduct(_ theproduct: Product) {
        self.product = theproduct
    }
    
    override func layoutSubviews() {

        let boxer = UIView()
        boxer.clipsToBounds = true
        boxer.backgroundColor = UIColor(r: 50, g: 50, b: 50, a:0.3)
        
        let title = UILabel()
        title.text = self.product?.desc
        title.font = UIFont.menuTitleFont()
        title.textColor = .white
        
        contentImageView.addSubview(boxer)
        contentImageView.addSubview(title)
        
        _ = boxer.anchor(contentImageView.bottomAnchor, left: contentImageView.leftAnchor, bottom: nil, right: contentImageView.rightAnchor, topConstant: -59, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentImageView.bounds.width, heightConstant: 60)
        
        _ = title.anchor(contentImageView.bottomAnchor, left: contentImageView.leftAnchor, bottom: nil, right: nil, topConstant: -54, leftConstant: 14, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
    }

    fileprivate func setupImageForGesture(contentView: UIImageView) {
    
        let imageView = contentView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectImage)))
        imageView.isUserInteractionEnabled = true

    }
    
    @objc fileprivate func handleSelectImage() {
    
    	flyingImage = contentImageView.image
    
    	let blankViewController = BlankViewController()
        
        if delegate?.responds(to: #selector(ExampleTableViewCell.handleSelectImage)) != nil {
            
            delegate?.loadNewScreen(controller: blankViewController)
        }
        
    }
    
    
}
