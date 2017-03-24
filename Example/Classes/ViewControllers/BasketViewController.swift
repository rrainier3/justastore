//
//  BasketViewController.swift
//  Example
//
//  Created by RayRainier on 3/8/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import Money

class BasketViewController: UITableViewController {
    
	let cellId = "cellId"
    let cellId2 = "cellId2"
    
    var blankViewController = BlankViewController()
    
    var total: Money?
    
    override func viewWillAppear(_ animated: Bool) {
    
        let thisTotal:Int = runTotalForBasket(basket)
        total = Money(minorUnits: thisTotal)
        print(total!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBasketNavigation()
        
        // Register [UITableViewCell]'s here
        self.tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: cellId)        
//        self.tableView.register(TotalTableViewCell.self, forCellReuseIdentifier: cellId2)
        
        // Setup and configure dataSource!
        self.tableView.dataSource = self
        
        // Remove separator for empty cells
//        self.tableView.tableFooterView = UIView(frame: .zero)
        
        self.setupTotalTableFooterView()
        
        // or Remove separator line on all cells
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        // prepare for swipe step-1
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        // Reload
        self.attemptReloadOfTable()
    }
    
    func setupTotalTableFooterView() {
        
    	let height = 100 - 8
        let width = 327
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        customView.backgroundColor = UIColor.clear
        
        let boxer = UIView(frame: CGRect(x: 28, y: 4, width: width, height: height))
        boxer.backgroundColor = UIColor(r: 230, g: 250, b: 230)
        customView.addSubview(boxer)
        customView.addSubview(titleLabel)
        customView.addSubview(totalLabel)

        _ = titleLabel.anchor(customView.topAnchor, left: customView.leftAnchor, bottom: nil, right: nil, topConstant: 14, leftConstant: 120, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 18)
        
        _ = totalLabel.anchor(customView.topAnchor, left: nil, bottom: nil, right: customView.rightAnchor, topConstant: 14, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 18)
        
        self.tableView.tableFooterView = customView
        
//        //totalLabel.text = totalFormatted
        
    }
    
    let containerView: UIView = {
        let container = UIView()
        //container.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        container.backgroundColor = .green
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.masksToBounds = true
        return container
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "$10.99"
        label.font = UIFont.navigationTitleFont()
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL"
        label.font = UIFont.navigationTitleFont()
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // run total for basket
    func runTotalForBasket(_ basket: [Product]) -> Int {
        var prices:[Int] = []
        basket.forEach { (b) -> () in
            prices.append(b.price!)
        }
        let total:Int = prices.reduce(0){ $0 + $1 }
        return total
    }
    
    // prepare for swipe step-2
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    
    	var canDelete: Bool = true
        
        if indexPath.section == 1 { canDelete = false }
        
        return canDelete

    }
    
    // prepare for swipe delete step-3
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            basket.remove(at: indexPath.row)
            let tTotal:Int = runTotalForBasket(basket)
			total = Money(minorUnits: tTotal)

            // Note that indexPath is wrapped in an array:  [indexPath]
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // basket is now empty go back to previous
            guard basket.count != 0 else {
                dismiss(animated: true, completion: nil)
                return
            }

			tableView.reloadData()
            
            // Attemp to ReEnter basket to clear totalSection
            self.blankViewController.handleBasketButton()
            
        }
    }
    
    func setupBasketNavigation() {
    
        self.view.backgroundColor = .white
        self.title = "Your Order"
        
        let uiFont = UIFont.navigationTitleFont()!
        let uiColor = refTintColor
        let titleAttributes = [NSFontAttributeName: uiFont as UIFont, NSForegroundColorAttributeName: uiColor as UIColor]
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
    
    func attemptReloadOfTable() {
        
        // dispatch_asynch main thread
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
        
    }
    
    func triggerLeftButton() {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let numberOfRows: Int = basket.count
        //var numberOfRows: Int = ProductItemsProvider.items.count
        
//        if section == 1 {
//        		numberOfRows = 1
//        }

//        if numberOfRows == 0 && section == 0 { 	// show basket is empty!
//            numberOfRows = 0
//            
//            basket = [Product]()
//            
//        }
        
        if numberOfRows == 0  { 	// show basket is empty!

            basket = [Product]()
        }
        
        return numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BasketTableViewCell
        
            // Configure the cell...
            let product = basket[indexPath.row]
            //let product = ProductItemsProvider.items[indexPath.row]
            
            // Turn off highlighter
            cell.selectionStyle = .none
            
            // Set product to trigger didSet() in BasketTableViewCell instance
            cell.product = product
            
//            switch(indexPath.section) {
//            case 0:
                cell.backgroundColor = UIColor.clear
                cell.textLabel?.text = product.desc
                cell.detailTextLabel?.text = product.subdesc
                cell.ProductImageView.image = product.normalImage

                let price = Money(minorUnits: product.price!)
                cell.priceLabel.text = "\(price)"

//            case 1:
//                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2, for: indexPath) as! TotalTableViewCell
//                cell.backgroundColor = UIColor.clear
//                cell.product = nil
//				
//                cell.totalFormatted = "\(total!)"
//
//            default:
//                fatalError("Unexpected section \(indexPath.section)")
//                
//            }

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        // Here, we use NSFetchedResultsController
//        // And we simply use the section name as title
////        let currSection = fetchedResultsController.sections?[section]
////        let title = currSection!.name
//        
//        // Dequeue with the reuse identifier
////        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("TableSectionHeader")
////        let header = cell as! TableSectionHeader
////        header.titleLabel.text = title
////        let cell = tableView.dequeueReusableCell(withIdentifier: cellId2, for: indexPath) as! TotalTableViewCell
//
//        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: cellId2)
//        cell?.backgroundColor = UIColor.clear
//        
////        cell.product = nil        
////        cell.totalFormatted = "\(total!)"
//        
//        return cell
//    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
