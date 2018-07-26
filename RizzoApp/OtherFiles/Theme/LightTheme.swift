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
    var modalCorrectBgImage: UIImage = #imageLiteral(resourceName: "modal/modalCorrect")
    var modalIncorrectBgImage: UIImage = #imageLiteral(resourceName: "modal/modalIncorrct")
    var backgroundColor: UIColor = UIColor(named: "DayColor")!
    var modalNextBtn: UIImage = #imageLiteral(resourceName: "modal/nextBtn")
}
