//
//  TotalTableViewCell.swift
//  Example
//
//  Created by RayRainier on 3/18/17.
//  Copyright © 2017 Yalantis. All rights reserved.
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    
    var product: Product? {
        didSet {
            
            setupNameAndProductImage()
            
            //detailTextLabel?.text = product?.subdesc
            detailTextLabel?.text = "Amazing product description"
            
            if let seconds = product?.timestamp?.doubleValue {
                let timestampDate = NSDate(timeIntervalSince1970: seconds)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "hh:mm:ss a"
                self.timeLabel.text = dateFormatter.string(from: timestampDate as Date)
                
            }
            
        }
    }
    
    private func setupNameAndProductImage() {
        
        //self.textLabel?.text = product?.desc
        textLabel?.text = "Ultimate Product"
        
        self.ProductImageView.image = product?.normalImage
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = self.bounds
        let width = bounds.width
        let height = bounds.height
        
        // In the box
        let someFrame = CGRect(x: 28, y: 4, width: width - 48, height: height - 8)
        containerView.frame = someFrame
        
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
        imageView.image = UIImage(named: "product_card1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "HH:MM:SS"
        label.font = UIFont.systemFont(ofSize: 12)
        //label.textColor = refTintColor
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(containerView)
        containerView.addSubview(ProductImageView)
//        containerView.addSubview(textLabel!)
//        containerView.addSubview(detailTextLabel!)
        containerView.addSubview(timeLabel)
        
        // x,y,width,height constraints
        ProductImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        ProductImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        ProductImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ProductImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: ProductImageView.rightAnchor, constant: 8).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
//        textLabel?.leftAnchor.constraint(equalTo: ProductImageView.leftAnchor, constant: -4).isActive = true
//        textLabel?.topAnchor.constraint(equalTo: ProductImageView.topAnchor, constant: 2).isActive = true
//        textLabel?.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
//        textLabel?.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true

//        detailTextLabel?.leftAnchor.constraint(equalTo: ProductImageView.leftAnchor, constant: -4).isActive = true
//        detailTextLabel?.topAnchor.constraint(equalTo: (textLabel?.bottomAnchor)!, constant: 2).isActive = true
//        detailTextLabel?.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
//        detailTextLabel?.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true

 		//x,y,width,height constraints
//        timeLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12).isActive = true
//        //timeLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
//        timeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18).isActive = true
//        timeLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        //timeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
