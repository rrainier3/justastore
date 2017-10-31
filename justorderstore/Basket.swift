//
//  Basket.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

var basket: Array = [Product]()

var basket2: Array = [BasketItem]()

struct BasketItem {
    let key, sku, desc, subdesc, normalImageURL, storeID: String
    let qty, price, extprice: Int
    
    init(key: String, sku: String, desc: String, subdesc: String, normalImageURL: String, storeID: String, qty: Int, price: Int) {
        self.key = key
        self.sku = sku
        self.desc = desc
        self.subdesc = subdesc
        self.normalImageURL = normalImageURL
        self.storeID = storeID
        self.qty = qty
        self.price = price
        self.extprice = qty * price
    }
    
}








