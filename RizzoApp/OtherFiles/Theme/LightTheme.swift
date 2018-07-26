//
//  LightTheme.swift
//  RizzoApp
//
//  Created by punyawee  on 22/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import Foundation
import UIKit

class LightTheme: ThemePotocol {
    var replayBtn: UIImage = #imageLiteral(resourceName: "FinishedLight/replay")
    var backToMainMenuBtn: UIImage = #imageLiteral(resourceName: "FinishedLight/homeBtn")
    var modalCorrectBgImage: UIImage = #imageLiteral(resourceName: "ModalLight/modalCorrect")
    var modalIncorrectBgImage: UIImage = #imageLiteral(resourceName: "ModalLight/modalIncorrct")
    var backgroundColor: UIColor = UIColor(named: "LightBackground")!
    var modalNextBtn: UIImage = #imageLiteral(resourceName: "ModalLight/nextBtn")
}
