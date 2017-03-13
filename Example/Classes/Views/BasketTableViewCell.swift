//
//  BasketTableViewCell.swift
//  Example
//
//  Created by RayRainier on 3/9/17.
//  Copyright © 2017 Yalantis. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    
    var product: Product? {
        didSet {
            
            setupNameAndProductImage()
            
            //detailTextLabel?.text = product?.subdesc
            
            if let seconds = product?.timestamp?.doubleValue {
                let timestampDate = NSDate(timeIntervalSince1970: seconds)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "hh:mm:ss a"
                timeLabel.text = dateFormatter.string(from: timestampDate as Date)
                
            }
            
        }
    }
    
    private func setupNameAndProductImage() {

		//self.textLabel?.text = product?.desc

		self.ProductImageView.image = product?.normalImage
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = self.bounds
        let width = bounds.width
        let height = bounds.height
        
        // Boxing our UITableViewCell
        let someFrame = CGRect(x: 16, y: 4, width: width - 32, height: height - 8)
        containerView.frame = someFrame
        
        // overriding textLabels' constraints in UITableViewCell
//        textLabel?.frame = CGRect(x: 64, y: ((textLabel?.frame.origin.y)! - 2), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
//        
//        detailTextLabel?.frame = CGRect(x: 64, y: ((detailTextLabel?.frame.origin.y)! + 2), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
    }
    
    let containerView: UIView = {
        let container = UIView()
        //container.layer.borderColor = UIColor.black.cgColor
        //container.layer.borderWidth = 1
        container.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.masksToBounds = true
        return container
    }()
    
    let ProductImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "product_card1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.layer.cornerRadius = 24
        //imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "HH:MM:SS"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = refTintColor
        //label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(containerView)
//        containerView.addSubview(ProductImageView)
//        containerView.addSubview(textLabel!)
//        containerView.addSubview(detailTextLabel!)
//        containerView.addSubview(timeLabel)

        // x,y,width,height constraints
//        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
//        //containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
//        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//        //containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        containerView.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
//        containerView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: 0).isActive = true
        
        // x,y,width,height constraints
//    	ProductImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
//        ProductImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
//        ProductImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
//        ProductImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        ProductImageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        
//        ProductImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
//        ProductImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        ProductImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        ProductImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
//        textLabel?.leftAnchor.constraint(equalTo: ProductImageView.leftAnchor, constant: -4).isActive = true
//		textLabel?.topAnchor.constraint(equalTo: ProductImageView.topAnchor, constant: 2).isActive = true
//        textLabel?.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
//        textLabel?.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
//        
//        detailTextLabel?.leftAnchor.constraint(equalTo: ProductImageView.leftAnchor, constant: -4).isActive = true
//        detailTextLabel?.topAnchor.constraint(equalTo: (textLabel?.bottomAnchor)!, constant: 2).isActive = true
//        detailTextLabel?.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
//        detailTextLabel?.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        // x,y,width,height constraints
//        timeLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12).isActive = true
//        //timeLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
//        timeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18).isActive = true
//        //timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        timeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
