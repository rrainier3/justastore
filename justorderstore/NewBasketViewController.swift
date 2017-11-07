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
    
    var blankViewController = ProductViewController()
    
    var total: Money?
    
    override func viewWillAppear(_ animated: Bool) {
        
        let thisTotal:Int = runTotalForBasket2(basket2)
        total = Money(minorUnits: thisTotal)
        print(total!)
        
    }

    // run total for basket2
    func runTotalForBasket2(_ basket: [BasketItem]) -> Int {
        var prices:[Int] = []
        basket.forEach { (b) -> () in
            prices.append(b.extprice)
        }
        let total:Int = prices.reduce(0){ $0 + $1 }
        return total
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupBasketNavigation()

		let tableView = UITableView()

        // Register [UITableViewCell]'s here
        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: cellId)
         
        // Setup and configure dataSource!
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // or Remove separator line on all cells
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        // prepare for swipe step-1
        tableView.allowsMultipleSelectionDuringEditing = true

		setupSubViews(tableView)

        // Remove separator for empty cells
        //self.tableView.tableFooterView = UIView(frame: .zero)
        
        setupTotalTableFooterView(tableView)
        
        // Reload
        self.attemptReloadOfTable(tableView)
        
    }
    
    func setupSubViews(_ tableView: UITableView) {
    
        let newHeight = self.view.bounds.height - 100
        
        let newWidth = self.view.bounds.width - 48
        
        self.view.addSubview(tableView)
        
        _ = tableView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: newHeight)
        
        let checkoutBox = UIView()
        
        checkoutBox.backgroundColor = .clear
        
        checkoutBox.addSubview(checkOutButton)
        
        self.view.addSubview(checkoutBox)
        
        _ = checkoutBox.anchor(tableView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 80)

		_ = checkOutButton.anchor(checkoutBox.topAnchor, left: checkoutBox.leftAnchor, bottom: nil, right: checkoutBox.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: newWidth, heightConstant: 50)
 
    }
    
    func setupTotalTableFooterView(_ tableView: UITableView) {
        
        let tTotal:Int = runTotalForBasket2(basket2)
        total = Money(minorUnits: tTotal)
        
        totalLabel.text = "\(total!)"
        
        let height = 100 - 8
        let width: Int = Int(self.view.bounds.width) - 48
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        customView.backgroundColor = UIColor.clear
        
        let boxer = UIView(frame: CGRect(x: 28, y: 4, width: width, height: height))
        boxer.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        
        customView.addSubview(boxer)
        customView.addSubview(titleLabel)
        customView.addSubview(totalLabel)
        customView.addSubview(separatorLineView)
        
        _ = titleLabel.anchor(customView.topAnchor, left: customView.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 120, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        _ = totalLabel.anchor(customView.topAnchor, left: nil, bottom: nil, right: customView.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 20)
        
        _ = separatorLineView.anchor(customView.topAnchor, left: customView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 28, bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(width), heightConstant: 1)
        
        tableView.tableFooterView = customView
        
    }
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "$10.99"
        label.font = UIFont(name: "GothamPro", size: 22)
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL"
        label.font = UIFont(name: "GothamPro", size: 22)
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorLineView: UIView = {
        let thinLine = UIView()
        thinLine.backgroundColor = refTintColor
        thinLine.translatesAutoresizingMaskIntoConstraints = false
        thinLine.layer.masksToBounds = true
        return thinLine
    }()

    let checkOutButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.RGBHex(0xA5BD73)
        
        //button.backgroundColor = refTintColor
        
        button.setTitle("C H E C K O U T", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.titleLabel?.font = UIFont(name: "GothamPro", size: 18)
        //button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleCheckOutButton), for: .touchUpInside)
        
        return button
    }()

	func handleCheckOutButton() {
        print(123)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // prepare for swipe step-2
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        let canDelete: Bool = true
        
        return canDelete
        
    }
    
    // prepare for swipe delete step-3
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            basket2.remove(at: indexPath.row)
            
            // Note that indexPath is wrapped in an array:  [indexPath]
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Lets run the total again!
            setupTotalTableFooterView(tableView)
            
            // basket is now empty go back to previous
            guard basket2.count != 0 else {
                dismiss(animated: true, completion: nil)
                return
            }
            
            tableView.reloadData()
            
            // Attemp to ReEnter basket to clear totalSection
            self.blankViewController.handleBasketButton()
            
        }
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
        
        // Turn off highlighter
        cell.selectionStyle = .none
        
        // Set product to trigger didSet() in BasketTableViewCell instance
        cell.basket = product
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = product.desc
        cell.detailTextLabel?.text = product.subdesc
        
        cell.ProductImageView.loadImageUsingCacheWithUrlString(product.normalImageURL)
        
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
