//
//  PreviewImage.swift
//  RizzoApp
//
//  Created by punyawee  on 24/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class PreviewImage: UIView {
    @IBOutlet weak var imageView: UIImageView! 
    @IBOutlet weak var closeButton: UIButton!
    var callback: (()->Void)? = nil
    @IBAction func tappedCloseBtn(_ sender: UIButton) {
        sender.playButtonSound()
        callback?()
    }
    func setup(center: CGPoint, size: CGSize) {
        self.center = center
        bounds.size = size
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}
