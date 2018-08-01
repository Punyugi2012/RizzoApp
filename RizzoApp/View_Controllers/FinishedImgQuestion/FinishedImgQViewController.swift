//
//  FinishedImgQViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class FinishedImgQViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    
 
    var getScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        print(getScore)
        correctLabel.text = "ตอบถูก \(getScore) ข้อ"
        incorrectLabel.text = "ตอบผิด \(10 - getScore) ข้อ"
        if !AppManager.shared.get(key: isLightThemeKey) {
            view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        }
    
    }
    
    @IBAction func replayGame(_ sender: UIButton) {
        sender.playButtonSound()
    }
    
    @IBAction func backToMainMenu(_ sender: UIButton) {
        sender.playButtonSound()
    }

}
