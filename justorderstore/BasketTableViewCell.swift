//
//  BasketTableViewCell.swift
//  Example
//
//  Created by RayRainier on 3/9/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import Money

class BasketTableViewCell: UITableViewCell {
    
    var basket: BasketItem? {
        didSet {
        
        	setupProductLabels(basket: basket!)
            
        }
    }
    
    private func setupProductLabels(basket: BasketItem) {
    
        let qty = basket.qty
        qtyLabel.text = "Qty:\(qty)"

        let price = Money(minorUnits: basket.price)
        priceLabel.text = "@\(price)"

        let extprice = Money(minorUnits: basket.extprice)
        extpriceLabel.text = "\(extprice)"
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = self.bounds
        let width = bounds.width
        let height = bounds.height
        
        // In the box
        let someFrame = CGRect(x: 28, y: 4, width: width - 48, height: height - 8)
        containerView.frame = someFrame
    
        // overriding textLabels' constraints in UITableViewCell
        textLabel?.frame = CGRect(x: 120, y: ((textLabel?.frame.origin.y)! - 12), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        
        detailTextLabel?.frame = CGRect(x: 120, y: ((detailTextLabel?.frame.origin.y)! - 10), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
        
    }
    
    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.masksToBounds = true
        return container
    }()

    let ProductImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "koreanchicken")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()

    let qtyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GothamPro", size: 16)
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GothamPro", size: 16)
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let extpriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GothamPro", size: 18)
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.textColor = .black
        detailTextLabel?.textColor = .black
        
        addSubview(textLabel!)
        addSubview(detailTextLabel!)
        
		addSubview(containerView)
        sendSubview(toBack: containerView)

        addSubview(ProductImageView)
        
		addSubview(qtyLabel)
        addSubview(priceLabel)
        addSubview(extpriceLabel)
        
        // x,y,width,height constraints
        ProductImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        ProductImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 28).isActive = true
        ProductImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        ProductImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true
        
        _ = qtyLabel.anchor(self.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: -30, leftConstant: 120, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 16)
 
        _ = priceLabel.anchor(self.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: -30, leftConstant: 180, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 16)
        
        _ = extpriceLabel.anchor(self.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: -30, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 18)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
