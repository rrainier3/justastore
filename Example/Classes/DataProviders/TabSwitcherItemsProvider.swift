//
//  TabItemsProvider.swift
//  ColorMatchTabs
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs

class TabItemsProvider {
    
    static let items = {
        return [
            TabItem(
            	title: "",
//                title: "Products",
				tintColor: UIColor.gray.withAlphaComponent(0.70),
                //tintColor: UIColor(red: 0.51, green: 0.72, blue: 0.25, alpha: 1.00),
                normalImage: UIImage(named: "products_normal")!,
                highlightedImage: UIImage(named: "products_highlighted")!
            ),
            TabItem(
            	title: "",
//                title: "Places",
				tintColor: UIColor.gray.withAlphaComponent(0.70),
//                tintColor: UIColor(red: 0.15, green: 0.67, blue: 0.99, alpha: 1.00),
                normalImage: UIImage(named: "venues_normal")!,
                highlightedImage: UIImage(named: "venues_highlighted")!
            ),
            TabItem(
            	title: "",
//                title: "Reviews",
				tintColor: UIColor.gray.withAlphaComponent(0.70),
//                tintColor: UIColor(red: 1.00, green: 0.61, blue: 0.16, alpha: 1.00),
                normalImage: UIImage(named: "reviews_normal")!,
                highlightedImage: UIImage(named: "reviews_highlighted")!
            ),
            TabItem(
            	title: "",
//                title: "Friends",
				tintColor: UIColor.gray.withAlphaComponent(0.70),
//                tintColor: UIColor(red: 0.96, green: 0.61, blue: 0.58, alpha: 1.00),
                normalImage: UIImage(named: "users_normal")!,
                highlightedImage: UIImage(named: "users_highlighted")!
            )
        ]
    }()
    
}

