//
//  HowToPlayGamesViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 4/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class HowToPlayGamesViewController: UIViewController {
    @IBOutlet var menuButtons: [UIButton]!
    var gameType: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        for button in menuButtons {
            button.animateBubbleAnimation()
        }
    }
    @IBAction func next(_ sender: UIButton) {
        gameType = sender.tag
        performSegue(withIdentifier: "ToHowToPlay", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HowToPlayViewController {
            let backItem = UIBarButtonItem()
            backItem.title = "ย้อนกลับ"
            backItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "THSarabunNew-Bold", size: 35)!], for: .normal)
            navigationItem.backBarButtonItem = backItem
            destination.navigationItem.backBarButtonItem = backItem
            destination.gameType = self.gameType
        }
    }
}
