//
//  DarkTheme.swift
//  RizzoApp
//
//  Created by punyawee  on 22/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import Foundation
import UIKit

class DarkTheme: ThemePotocol {
    var viewBackgroundColor: UIColor = #colorLiteral(red: 0.9216, green: 0.9216, blue: 0.9216, alpha: 1)
    var fontColor: UIColor = #colorLiteral(red: 0.9216, green: 0.9216, blue: 0.9216, alpha: 1)
    var replayBtn: UIImage = #imageLiteral(resourceName: "FinishedDark/replayBtn")
    var backToMainMenuBtn: UIImage = #imageLiteral(resourceName: "FinishedDark/homeBtn")
    var modalCorrectBgImage: UIImage = #imageLiteral(resourceName: "ModalDark/modalCorrect")
    var modalIncorrectBgImage: UIImage = #imageLiteral(resourceName: "ModalDark/modalInCorrect")
    var backgroundColor: UIColor = UIColor(named: "DarkBackground")!
    var modalNextBtn: UIImage = #imageLiteral(resourceName: "ModalDark/nextBtn")
}
