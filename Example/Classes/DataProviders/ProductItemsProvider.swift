//
//  ProductItemsProvider.swift
//  Example
//
//  Created by RayRainier on 3/9/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class ProductItemsProvider {
    
    static let items = {
        return [
            Product(dictionary:[
                "sku": "1234560" as AnyObject,
                "desc": "Ceasar Salad Special" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "bluegreen")!,
                "qty": 7 as AnyObject,
                "price": 100 as AnyObject
                ]),
            Product(dictionary:[
                "sku": "2345678" as AnyObject,
                "desc": "Chopped Salad Special" as AnyObject,
                "subdesc": "Beef Flavor" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "green_sprite")!,
                "qty": 9 as AnyObject,
                "price": 75 as AnyObject
                ]),
            Product(dictionary:[
                "sku": "1234567" as AnyObject,
                "desc": "Ceasar Salad Special" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "blue_sprite")!,
                "qty": 7 as AnyObject,
                "price": 100 as AnyObject
                ]),
            Product(dictionary:[
                "sku": "2345679" as AnyObject,
                "desc": "Chopped Salad Special" as AnyObject,
                "subdesc": "Beef Flavor" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "red_sprite")!,
                "qty": 9 as AnyObject,
                "price": 75 as AnyObject
                ])
        ]
    }()
    
}

