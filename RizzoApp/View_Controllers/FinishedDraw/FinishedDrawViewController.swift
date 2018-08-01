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
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var drawedImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        print(isCorrect)
        print(getQuestionName)
        if isCorrect {
            resultLabel.text = "มันคือ \(getQuestionName)"
            resultImageView.image = #imageLiteral(resourceName: "Finished/correct")
        }
        else {
            resultLabel.text = "มันยังไม่ใช่ \(getQuestionName)"
            resultImageView.image = #imageLiteral(resourceName: "Finished/incorrect")
        }
        drawedImageView.image = getDrawedImage
        if !AppManager.shared.get(key: isLightThemeKey) {
            view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        }
        resultLabel.textColor = AppManager.shared.currentTheme?.fontColor
    }

    @IBAction func replay(_ sender: UIButton) {
        sender.playButtonSound()
    }
    
    @IBAction func backToMainMenu(_ sender: UIButton) {
        sender.playButtonSound()
    }
   

}
