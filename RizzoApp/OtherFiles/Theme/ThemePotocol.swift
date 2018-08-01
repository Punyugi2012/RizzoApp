//
//  ThemePotocol.swift
//  RizzoApp
//
//  Created by punyawee  on 22/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import Foundation
import UIKit

protocol ThemePotocol {
    var modalCorrectBgImage: UIImage {get}
    var modalIncorrectBgImage: UIImage {get}
    var backgroundColor: UIColor {get}
    var modalNextBtn: UIImage {get}
    var replayBtn: UIImage {get}
    var backToMainMenuBtn: UIImage {get}
    var fontColor: UIColor {get}
    var viewBackgroundColor: UIColor {get}
}
