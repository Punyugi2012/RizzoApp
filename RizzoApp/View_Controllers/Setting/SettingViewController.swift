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
        if AppManager.shared.get(key: isLightThemeKey) {
            themeSwitch.isOn = true
        }
        else {
            themeSwitch.isOn = false
        }
        setView()
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
        if sender.isOn {
            AppManager.shared.set(key: isLightThemeKey, value: true)
            AppManager.shared.currentTheme = LightTheme()
        }
        else {
            AppManager.shared.set(key: isLightThemeKey, value: false)
            AppManager.shared.currentTheme = DarkTheme()
        }
        setView()
    }
    
    func setView() {
        if !AppManager.shared.get(key: isLightThemeKey) {
            view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        }
        else {
            view.backgroundColor = UIColor.white
        }
    }
    
}
