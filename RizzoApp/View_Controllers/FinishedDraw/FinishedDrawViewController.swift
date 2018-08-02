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
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var drawedImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        print(isCorrect)
        print(getQuestionName)
        setView()
    }
    
    func setView() {
        if isCorrect {
            resultLabel.text = "มันคือ \(getQuestionName)"
            resultImageView.image = #imageLiteral(resourceName: "Finished/correct")
            borderView.layer.borderColor = UIColor.green.cgColor
        }
        else {
            resultLabel.text = "มันยังไม่ใช่ \(getQuestionName)"
            resultImageView.image = #imageLiteral(resourceName: "Finished/incorrect")
            borderView.layer.borderColor = UIColor.red.cgColor
        }
        borderView.layer.cornerRadius = 10
        borderView.clipsToBounds = true
        borderView.layer.borderWidth = 2
        drawedImageView.image = getDrawedImage
        if !AppManager.shared.get(key: isLightThemeKey) {
            view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        }
        resultLabel.textColor = AppManager.shared.currentTheme?.fontColor
        titleLabel.text = "ผลการวาด\(getQuestionName)"
    }

    @IBAction func replay(_ sender: UIButton) {
        sender.playButtonSound()
    }
    
    @IBAction func backToMainMenu(_ sender: UIButton) {
        sender.playButtonSound()
    }
   

}
