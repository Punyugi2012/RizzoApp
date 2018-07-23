//
//  MainMenuViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.898, green: 0.7098, blue: 0.8314, alpha: 1)
        let backItem = UIBarButtonItem()
        backItem.title = "ย้อนกลับ"
        navigationItem.backBarButtonItem = backItem
        setNavigationBar()
    }
    
    
    @IBAction func backToMainMenu(segue: UIStoryboardSegue) {
        if segue.source is FinishedSoundQViewController {
            if AppManager.shared.get(key: backgroundSoundKey) {
                AppManager.shared.playBackgroundSound()
            }
        }
    }
    
    @IBAction func playImgQuestion(_ sender: UIButton) {
        sender.playButtonSound()
        performSegue(withIdentifier: "ToPrepareImgQuestion", sender: self)
    }
    
    @IBAction func playSoundQuestion(_ sender: UIButton) {
        sender.playButtonSound()
        performSegue(withIdentifier: "ToPrepareSoundQuestion", sender: self)
    }
    
    @IBAction func playDraw(_ sender: UIButton) {
        sender.playButtonSound()
        performSegue(withIdentifier: "ToPrepareDraw", sender: self)
    }
    
    @IBAction func setting(_ sender: UIButton) {
        sender.playButtonSound()
        performSegue(withIdentifier: "ToSetting", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       
//    }
 
}
