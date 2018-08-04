//
//  MainMenuViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit
import SpriteKit

class MainMenuViewController: UIViewController {

    @IBOutlet var menuButtons: [UIButton]!
    @IBOutlet weak var creditButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backItem = UIBarButtonItem()
        backItem.title = "ย้อนกลับ"
        backItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "THSarabunNew-Bold", size: 35)!], for: .normal)
        navigationItem.backBarButtonItem = backItem
        creditButton.layer.cornerRadius = creditButton.frame.height / 2
        creditButton.clipsToBounds = true
        setNavigationBar()
        setView()
        setLoadingView()
    }
    
    func setLoadingView() {
        let loadingView = SKView()
        loadingView.frame = self.view.frame
        view.addSubview(loadingView)
        loadingView.presentScene(LoadingScene(size: view.frame.size))
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            UIView.animate(withDuration: 0.5, animations: {
                loadingView.alpha = 0
            }, completion: { (true) in
                loadingView.removeFromSuperview()
            })
        }
    }
    
    @IBAction func backToMainMenu(segue: UIStoryboardSegue) {
        if segue.source is FinishedSoundQViewController || segue.source is SoundQuestionViewController {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setView()
    }
    
    func setView() {
        view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        for button in menuButtons {
            button.animateBubbleAnimation()
        }
    }
    
}
