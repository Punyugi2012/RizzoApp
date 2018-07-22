//
//  AppManager.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import Foundation
import AVFoundation


let backgroundSoundKey = "BackgroundSoundKey"
let buttonSoundKey = "ButtonSoundKey"
let isLightThemeKey = "IsLightThemeKey"

class AppManager {
    static let shared = AppManager()
    
    private let backgroundPlayer: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "bgSound", withExtension: "mp3") else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            
            return player
        }catch {
            return nil
        }
    }()
    
    private let buttonPlayer: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "btnSound", withExtension: "mp3") else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            
            return player
        }catch {
            return nil
        }
    }()
    
    func playBackgroundSound() {
        AppManager.shared.backgroundPlayer?.stop()
        AppManager.shared.backgroundPlayer?.currentTime = 0
        AppManager.shared.backgroundPlayer?.play()
    }
    
    func stopBackgroundSound() {
        AppManager.shared.backgroundPlayer?.stop()
    }
    
    func playButtonSound() {
        if AppManager.shared.get(key: buttonSoundKey) {
            AppManager.shared.buttonPlayer?.stop()
            AppManager.shared.buttonPlayer?.currentTime = 0
            AppManager.shared.buttonPlayer?.play()
        }
    }
    
    func set(key k: String, value v: Bool) {
        UserDefaults.standard.set(v, forKey: k)
        UserDefaults.standard.synchronize()
    }
    
    func get(key k: String) -> Bool {
        return UserDefaults.standard.bool(forKey: k)
    }
    
    func activate() {
        if UserDefaults.standard.object(forKey: backgroundSoundKey) != nil &&
            UserDefaults.standard.object(forKey: buttonSoundKey) != nil &&
            UserDefaults.standard.object(forKey: isLightThemeKey) != nil {
            print("Not First Launch App")
            let backgroundSound = AppManager.shared.get(key: backgroundSoundKey)
            let lightTheme = AppManager.shared.get(key: isLightThemeKey)
            if backgroundSound {
                AppManager.shared.playBackgroundSound()
            }
            else {
                AppManager.shared.stopBackgroundSound()
            }
            if lightTheme {
                // LightTheme
            }
            else {
                // DarkTheme
            }
        }
        else {
            print("First Launch App")
            AppManager.shared.set(key: backgroundSoundKey, value: true)
            AppManager.shared.set(key: buttonSoundKey, value: true)
            AppManager.shared.set(key: isLightThemeKey, value: true)
            AppManager.shared.playBackgroundSound()
        }
    }
    
}

