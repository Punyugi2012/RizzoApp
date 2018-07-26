//
//  FinishedDrawViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class FinishedDrawViewController: UIViewController {

    var isCorrect = false
    var getQuestionName = ""
    var getDrawedImage: UIImage!
    
    @IBOutlet weak var replayBtn: UIButton!
    @IBOutlet weak var backToMainMenuBtn: UIButton!
    
    @IBOutlet weak var drawedImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        print(isCorrect)
        print(getQuestionName)
        if isCorrect {
            resultLabel.text = "ถูกต้อง!! มันคือ\(getQuestionName)"
        }
        else {
            resultLabel.text = "ไม่ถูกต้อง!! มันยังไม่ใช่\(getQuestionName)"
        }
        drawedImageView.image = getDrawedImage
        if !AppManager.shared.get(key: isLightThemeKey) {
            view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        }
        replayBtn.setBackgroundImage(AppManager.shared.currentTheme?.replayBtn, for: .normal)
        backToMainMenuBtn.setBackgroundImage(AppManager.shared.currentTheme?.backToMainMenuBtn, for: .normal)
    }

    @IBAction func replay(_ sender: UIButton) {
        sender.playButtonSound()
    }
    
    @IBAction func backToMainMenu(_ sender: UIButton) {
        sender.playButtonSound()
    }
   

}
