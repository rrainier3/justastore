//
//  BasketViewController.swift
//  Example
//
//  Created by RayRainier on 3/8/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

var basket: Array = [Product]()

class BasketViewController: UITableViewController {

	let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        self.tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: cellId)
        
        // Setup and configure dataSource!
        self.tableView.dataSource = self
        
        // Remove separator for empty cells
        self.tableView.tableFooterView = UIView(frame: .zero)
        // or Remove separator line on all cells
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })

    }
    
    func triggerLeftButton() {

        dismiss(animated: true, completion: nil)
		self.view = nil
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        self.view = nil
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return ProductItemsProvider.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BasketTableViewCell

        // Configure the cell...
        let product = ProductItemsProvider.items[indexPath.row]
        
        // Turn off highlighter
        cell.selectionStyle = .none
        
        // Set product to trigger didSet() in BasketTableViewCell instance
        cell.product = product

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
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
