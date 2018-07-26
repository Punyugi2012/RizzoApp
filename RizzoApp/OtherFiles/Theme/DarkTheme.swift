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
    var modalCorrectBgImage: UIImage = #imageLiteral(resourceName: "modal/nightModalCorrect")
    var modalIncorrectBgImage: UIImage = #imageLiteral(resourceName: "modal/nightModalIncorrect")
    var backgroundColor: UIColor = UIColor(named: "NightColor")!
    var modalNextBtn: UIImage = #imageLiteral(resourceName: "modal/nightNextBtn")
}
