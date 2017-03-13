//
//  ExampleViewContoller.swift
//  ColorMatchTabs
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs

var refTintColor: UIColor = UIColor()

class ExampleViewContoller: ColorMatchTabsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont.navigationTitleFont()!
                
        // to hide bottom button comment the following line
//        popoverViewController = ExamplePopoverViewController()
//        popoverViewController?.delegate = self
        
        dataSource = self
        reloadData()
    }

}

extension ExampleViewContoller: ColorMatchTabsViewControllerDataSource {

    
    func numberOfItems(inController controller: ColorMatchTabsViewController) -> Int {
        return TabItemsProvider.items.count
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, viewControllerAt index: Int) -> UIViewController {
        
        return StubContentViewControllersProvider.viewControllers[index]
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, titleAt index: Int) -> String {
        
        return TabItemsProvider.items[index].title
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, iconAt index: Int) -> UIImage {
    
        return TabItemsProvider.items[index].normalImage
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, hightlightedIconAt index: Int) -> UIImage {
    
        return TabItemsProvider.items[index].highlightedImage
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, tintColorAt index: Int) -> UIColor {
    
        switch index {
        
            case 1:
                titleLabel.text = "HONG-NING"
            case 2:
                titleLabel.text = "JO-FEN"
            case 3:
                titleLabel.text = "STARBUCKS"
            default:
                titleLabel.text = "WHOLEFOODS"
            
        }
        
        refTintColor = TabItemsProvider.items[index].tintColor
        
        return TabItemsProvider.items[index].tintColor
    }
    
}

extension ExampleViewContoller: PopoverViewControllerDelegate {

    func popoverViewController(_ popoverViewController: PopoverViewController, didSelectItemAt index: Int) {
        selectItem(at: index)
    }
    
}
