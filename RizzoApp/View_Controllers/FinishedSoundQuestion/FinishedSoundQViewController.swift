//
//  FinishedSoundQViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class FinishedSoundQViewController: UIViewController {
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var allQuestionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var starsImageView: [UIImageView]!
    var getScore: Int = 0
    var numberOfStar = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        print(getScore)
        setView()
    }
    
    func setView() {
        allQuestionLabel.text = "ทั้งหมด 10 ข้อ"
        correctLabel.text = "ตอบถูก \(getScore) ข้อ"
        incorrectLabel.text = "ตอบผิด \(10 - getScore) ข้อ"
        if getScore >= 8 {
            resultLabel.text = "ยอดเยี่ยมมาก"
            numberOfStar = 3
        }
        else if getScore >= 5 {
            resultLabel.text = "เก่งมาก"
            numberOfStar = 2
        }
        else if getScore >= 1 {
            resultLabel.text = "เก่งๆ"
            numberOfStar = 1
        }
        else {
            resultLabel.text = "แย่จัง"
            numberOfStar = 0
        }
        if !AppManager.shared.get(key: isLightThemeKey) {
            view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var delay = 0.2
        for starImageView in starsImageView {
            if numberOfStar > 0 {
                starImageView.image = #imageLiteral(resourceName: "Finished/star")
            }
            else {
                starImageView.image = #imageLiteral(resourceName: "Finished/starBlank")
            }
            starImageView.popIn(delay: delay)
            numberOfStar -= 1
            delay += 0.3
        }
    }
    
    @IBAction func replayGame(_ sender: UIButton) {
        sender.playButtonSound()
    }
    
    @IBAction func backToMainMenu(_ sender: UIButton) {
        sender.playButtonSound()
    }
    
}
