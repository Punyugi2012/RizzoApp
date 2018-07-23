//
//  SettingViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var buttonSoundSwitch: UISwitch!
    @IBOutlet weak var backgroundSoundSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        themeSwitch.transform = CGAffineTransform(scaleX: 2, y: 2)
        buttonSoundSwitch.transform = CGAffineTransform(scaleX: 2, y: 2)
        backgroundSoundSwitch.transform = CGAffineTransform(scaleX: 2, y: 2)
        if AppManager.shared.get(key: backgroundSoundKey) {
            backgroundSoundSwitch.isOn = true
        }
        else {
            backgroundSoundSwitch.isOn = false
        }
        if AppManager.shared.get(key: buttonSoundKey) {
            buttonSoundSwitch.isOn = true
        }
        else {
            buttonSoundSwitch.isOn = false
        }
    }

    @IBAction func changedBgSoundSwitch(_ sender: UISwitch) {
        if sender.isOn {
            AppManager.shared.set(key: backgroundSoundKey, value: true)
            AppManager.shared.playBackgroundSound()
        }
        else {
            AppManager.shared.set(key: backgroundSoundKey, value: false)
            AppManager.shared.stopBackgroundSound()
        }
    }
    
    @IBAction func changedBtnSoundSwitch(_ sender: UISwitch) {
        if sender.isOn {
            AppManager.shared.set(key: buttonSoundKey, value: true)
        }
        else {
            AppManager.shared.set(key: buttonSoundKey, value: false)
        }
    }
    
    @IBAction func changedThemeSwitch(_ sender: UISwitch) {
    }
    
}
