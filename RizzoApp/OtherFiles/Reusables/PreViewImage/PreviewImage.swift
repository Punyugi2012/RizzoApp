//
//  PreviewImage.swift
//  RizzoApp
//
//  Created by punyawee  on 24/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class PreviewImage: UIView {
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 20
            imageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var closeButton: UIButton!
    var callback: (()->Void)? = nil
    @IBAction func tappedCloseBtn(_ sender: UIButton) {
        callback?()
    }
}
