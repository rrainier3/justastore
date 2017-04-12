//
//  BlurredBackground.swift
//  Example
//
//  Created by RayRainier on 3/12/17.
//  Copyright © 2017 Yalantis. All rights reserved.
//

import UIKit

class BlurredBackgroundView: UIView {
    let imageView: UIImageView
    let blurView: UIVisualEffectView
    
    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: .dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        imageView = UIImageView(image: UIImage.gorgeousImage())
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(blurView)
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        self.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        blurView.frame = bounds
    }
}

extension UIImage {
    class func gorgeousImage() -> UIImage {
        return UIImage(named: "bluegreen")!
    }
}
