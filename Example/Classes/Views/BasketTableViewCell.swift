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
            
            detailTextLabel?.text = product?.subdesc
            
            if let seconds = product?.timestamp?.doubleValue {
                let timestampDate = NSDate(timeIntervalSince1970: seconds)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "hh:mm:ss a"
                timeLabel.text = dateFormatter.string(from: timestampDate as Date)
                
            }
            
        }
    }
    
    private func setupNameAndProductImage() {

		self.textLabel?.text = product?.desc

		self.ProductImageView.image = product?.normalImage
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // overriding textLabels' constraints in UITableViewCell
        textLabel?.frame = CGRect(x: 64, y: ((textLabel?.frame.origin.y)! - 2), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        
        detailTextLabel?.frame = CGRect(x: 64, y: ((detailTextLabel?.frame.origin.y)! + 2), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
    }
    
    let ProductImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "product_card1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "HH:MM:SS"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(ProductImageView)
        addSubview(timeLabel)
        
        // x,y,width,height constraints
        ProductImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        ProductImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ProductImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        ProductImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        // x,y,width,height constraints
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
