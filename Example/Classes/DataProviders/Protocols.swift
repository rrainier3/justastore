//
//  Protocols.swift
//  Example
//
//  Created by RayRainier on 3/21/17.
//  Copyright © 2017 Yalantis. All rights reserved.
//

import UIKit

protocol ChangeViewProtocol: NSObjectProtocol {
    func loadNewScreen(controller: UIViewController) -> Void
}


