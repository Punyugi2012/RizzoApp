//
//  ModalView.swift
//  RizzoApp
//
//  Created by punyawee  on 22/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class ModalView: UIView {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var isAnswerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var callBack: (() -> Void)? = nil
    @IBAction func tappedNextButton(_ sender: UIButton) {
        sender.playButtonSound()
        callBack?()
    }
    func setup(center: CGPoint, size: CGSize) {
        self.center = center
        bounds.size = size
        isAnswerLabel.textColor = AppManager.shared.currentTheme?.fontColor
    }
}
