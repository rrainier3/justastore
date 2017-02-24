//
//  StoreViewController.swift
//  Example
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 Yalantis. All rights reserved.
//
//		Generic Store Version

import UIKit
import ColorMatchTabs

class StoreViewContoller: ColorMatchTabsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "JoFen"
        titleLabel.font = UIFont.navigationTitleFont()
        // to hide bottom button remove the following line
//        popoverViewController = ExamplePopoverViewController()
//        
//        popoverViewController?.delegate = self
        
        dataSource = self
        reloadData()
    }
    
}

extension StoreViewContoller: ColorMatchTabsViewControllerDataSource {
    
    func numberOfItems(inController controller: ColorMatchTabsViewController) -> Int {
        return TabItemsProvider.items.count
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, viewControllerAt index: Int) -> UIViewController {
        //return StubContentViewControllersProvider.viewControllers[index]
        return UIViewController()
        
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
        return TabItemsProvider.items[index].tintColor
    }
    
}

extension StoreViewContoller: PopoverViewControllerDelegate {
    
    func popoverViewController(_ popoverViewController: PopoverViewController, didSelectItemAt index: Int) {
        selectItem(at: index)
    }
    
}
