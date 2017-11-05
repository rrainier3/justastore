//
//  NewBasketViewController.swift
//  justorderstore
//
//  Created by RayRainier on 11/4/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import Money

class NewBasketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupBasketNavigation()
        
        let tableViewController = BasketViewController()
        
		let tableView: UITableView = tableViewController.tableView

        // Register [UITableViewCell]'s here
        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: cellId)
         
        // Setup and configure dataSource!
        
        tableView.delegate = self
        tableView.dataSource = self

        // Reload
        self.attemptReloadOfTable(tableView)
        
        let newHeight = self.view.bounds.height - 100
        
        
        self.view.addSubview(tableView)
        
		_ = tableView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: newHeight)
        
        let checkoutBox = UIView()
        
        checkoutBox.backgroundColor = .red
        
        self.view.addSubview(checkoutBox)
        
        _ = checkoutBox.anchor(tableView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 100)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func setupBasketNavigation() {
        
        self.view.backgroundColor = .white
        self.title = "Your Order"
        
        let uiFont = UIFont(name: "GothamPro", size: 24)
        
        let uiColor = refTintColor
        let titleAttributes = [NSFontAttributeName: uiFont! as UIFont, NSForegroundColorAttributeName: uiColor as UIColor]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        UINavigationBar.appearance().barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage(named: "TransparentPixel1")
        let pixelImage = UIImage(named: "Pixel1")
        navigationController?.navigationBar.setBackgroundImage(pixelImage, for: .default)
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.tintColor = refTintColor
        
        let leftButton =  UIBarButtonItem(image: UIImage(named: "left-arrow"), style: .plain, target: self, action: #selector(triggerLeftButton))
        navigationItem.leftBarButtonItem = leftButton
        
    }

    func triggerLeftButton() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let numberOfRows: Int = basket2.count
        //var numberOfRows: Int = ProductItemsProvider.items.count
        
        if numberOfRows == 0  { 	// basket is empty!
            
            //basket = [Product]()
            
            basket2 = [BasketItem]()
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BasketTableViewCell
        
        // Configure the cell...
        let product = basket2[indexPath.row]
        //let product = ProductItemsProvider.items[indexPath.row]
        
        // Turn off highlighter
        cell.selectionStyle = .none
        
        // Set product to trigger didSet() in BasketTableViewCell instance
        cell.basket = product
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = product.desc
        cell.detailTextLabel?.text = product.subdesc
        
        cell.ProductImageView.loadImageUsingCacheWithUrlString(product.normalImageURL)
        
        // cell.ProductImageView.image = product.normalImage
        
        //        let price = Money(minorUnits: product.extprice)
        //        cell.priceLabel.text = "\(price)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func attemptReloadOfTable(_ tableView: UITableView) {
        
        // dispatch_asynch main thread
        DispatchQueue.main.async(execute: {
        	tableView.reloadData()
        })
        
    }
}
