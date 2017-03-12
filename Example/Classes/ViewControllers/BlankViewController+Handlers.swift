//
//  BlankViewController+Handlers.swift
//  Example
//
//  Created by RayRainier on 3/3/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs

extension BlankViewController {

    func changePriceLabel(_ selectedIndex: Int) {
    
    // we can implement this within a dictionary [index, value] returning value
        switch selectedIndex {
        case 1:
            priceLabel.text = "$19.95"
        case 2:
        	priceLabel.text = "$49.50"
        case 3:
        	priceLabel.text = "$75.00"
        default:
            priceLabel.text = "$19.95"
        }
        return
    }
    
    func setupViews() {
        
        self.view.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
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
        
        // insert our priceLabel
        priceLabel.font = UIFont.navigationTitleFont()
        containerView.addSubview(priceLabel)
        
        _ = priceLabel.anchor(productLabel.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        // insert our segmented-control here
        segmentedControl.itemTitles = ["S","M","L"]
        segmentedControl.didSelectItemWith = { (index, title) -> () in
            print("Selected item \(index) for \(title)")
            self.changePriceLabel(index)
        }
        
        containerView.addSubview(segmentedControl)
        
        _ = segmentedControl.anchor(productSubLabel.bottomAnchor, left: productSubLabel.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 16, leftConstant: 8, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 40)
        
        textView.font = UIFont.menuTitleFont()
        containerView.addSubview(textView)
        
        _ = textView.anchor(segmentedControl.bottomAnchor, left: productSubLabel.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 10, leftConstant: -2, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 0)
        
        containerView.addSubview(addButton)
        
        _ = addButton.anchor(textView.bottomAnchor, left: textView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 20, rightConstant: 12, widthConstant: 0, heightConstant: 50)
    }

    // #selector handle addButton action
    func handleAddButton() {
        
        giBadgeView.increment()
        
        print(giBadgeView.badgeValue)
        
        // Note: badgeValue initializes back to zero upon dismissing of viewController...so we must define a global var to hold the basket's badgeValue + items-added

        
        //let product = Product()
        
        
    }
    
    // #selector handle basketButton action
    func handleBasketButton() {
        
		print("BASKET Button pressed!")
        
        let basketViewController = BasketViewController()
        
        self.navigationController?.pushViewController(basketViewController, animated: true)
        
    }
    
    func setupNavigationButtons() {
        
        self.title = "StoreItem"
        
        let uiFont = UIFont.navigationTitleFont()!
        let uiColor = refTintColor
        let titleAttributes = [NSFontAttributeName: uiFont as UIFont, NSForegroundColorAttributeName: uiColor as UIColor]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        self.view.backgroundColor = .white
        
        let navigationBar = navigationController!.navigationBar
        navigationBar.backgroundColor = .white
        navigationBar.tintColor = refTintColor
        
        let leftButton =  UIBarButtonItem(image: UIImage(named: "left-arrow"), style: .plain, target: self, action: #selector(triggerLeftButton))
        
		// let's setup the rightButton for our basket
        
        let imageSize:CGSize = CGSize(width: 24, height: 24)
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 96, y: 96, width: 26, height: 26)
        rightButton.setImage(#imageLiteral(resourceName: "basket3"), for: .normal)
        rightButton.imageEdgeInsets = UIEdgeInsetsMake(rightButton.frame.size.height/2 - imageSize.height/2, rightButton.frame.size.width/2 - imageSize.width/2, rightButton.frame.size.height/2 - imageSize.height/2, rightButton.frame.size.width/2 - imageSize.width/2)
        
        rightButton.addTarget(self, action: #selector(handleBasketButton), for: .touchUpInside)
        
        // setup the badge on the basket!
        rightButton.addSubview(giBadgeView)
        
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)

    }
    
    @objc fileprivate func triggerLeftButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
