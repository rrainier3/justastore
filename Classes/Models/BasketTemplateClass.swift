//
//  BasketTemplateClass.swift
//  Example
//
//  Created by RayRainier on 3/23/17.
//  Copyright © 2017 Yalantis. All rights reserved.
//

import UIKit

class BasketTemplate: NSObject {
    
    var total: Int?
    var count: Int?
    var items: [Product]?
    
    init(_ products: [Any]) {
        super.init()
        
        items = products as? [Product]
        
        // checking for duplicates & process total
        var result:[Product] = []
        var prices:[Int] = []
        items?.forEach({ (i) -> () in
            if !result.contains(where: { $0.desc == i.desc }) {
                result.append(i)
                prices.append(i.price!)
            }
        })
        
        self.items = result
        self.count = result.count
        self.total = prices.reduce(0) { return $0 + $1 }
    }
    
    deinit {
        self.items = nil
        self.total = nil
        self.count = nil
    }
}
