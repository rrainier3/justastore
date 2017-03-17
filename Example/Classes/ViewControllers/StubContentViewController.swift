//
//  ExampleViewController.swift
//  ColorMatchTabs
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

var flyingImage: UIImage!		// global image ;)
var flyingProduct: Product!

class StubContentViewController: UITableViewController, ChangeViewProtocol {
    
    enum `Type` {
        case products, venues, reviews, users
    }
    
    var type: Type!
    
    //fileprivate var objects: [UIImage] = []
    
    fileprivate var objects: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filterProducts = ProductItemsProvider.items
        let products69 = filterProducts.filter({ $0.price == 69 })
        let products49 = filterProducts.filter({ $0.price == 49 })
        let products100 = filterProducts.filter({ $0.price == 100 })
        
        setupTableView()
        
        switch type! {
            case .products:
                self.objects = products69
            case .users:
                self.objects = products49
            case .reviews:
                self.objects = products100
            case .venues:
                self.objects = products49
        }
        
        //setupDataSource()
    }
    
    fileprivate func setupTableView() {
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = false
        tableView.separatorColor = UIColor.clear
        tableView.register(UINib(nibName: "ExampleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
//    fileprivate func setupDataSource() {
//        if type == .products || type == .reviews {
//            self.objects = [UIImage(named: "product_card1")!, UIImage(named: "product_card2")!]
//        } else if type == .users {
//            self.objects = [UIImage(named: "venue_card1")!, UIImage(named: "venue_card2")!]
//        } else if type == .venues {
//            self.objects = [UIImage(named: "venue_card1")!, UIImage(named: "venue_card2")!, UIImage(named: "product_card1")!, UIImage(named: "product_card2")!]
//        }
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExampleTableViewCell
        
        var image: UIImage!
        
        image = objects[(indexPath as NSIndexPath).row].normalImage
        
        var product: Product!
        
        product = objects[(indexPath as NSIndexPath).row]
        
		cell.delegate = self		// to enable ChangeViewProtocol
        
        flyingImage = image
        
        cell.apply(flyingImage)
        
        cell.product = product
        //cell.applyProduct(product)
        
        cell.clipsToBounds = true
        
        return cell
    }
    
    // implement ChangeViewProtocol method
    func loadNewScreen(controller: UIViewController) {
        
        let destViewController = BlankViewController()
        let navController = UINavigationController(rootViewController: destViewController)
        // we use self.show instead of self.present(controller)
        self.show(navController, sender: self)

    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.width / 1.4
    }
    
}
