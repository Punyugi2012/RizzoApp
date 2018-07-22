//
//  Extensions.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//


import UIKit

extension UIButton {
    func playButtonSound() {
        AppManager.shared.playButtonSound()
    }
}

extension UIViewController {
    func setNavigationBar() {
        navigationItem.title = ""
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
}
