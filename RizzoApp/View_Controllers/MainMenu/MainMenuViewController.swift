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
        navigationItem.title = ""
        view.backgroundColor = #colorLiteral(red: 0.898, green: 0.7098, blue: 0.8314, alpha: 1)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    @IBAction func backToMainMenu(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func playImgQuestion(_ sender: UIButton) {
        performSegue(withIdentifier: "ToPrepareImgQuestion", sender: self)
    }
    
    @IBAction func playSoundQuestion(_ sender: UIButton) {
        performSegue(withIdentifier: "ToPrepareSoundQuestion", sender: self)
    }
    
    @IBAction func playDraw(_ sender: UIButton) {
        performSegue(withIdentifier: "ToPrepareDraw", sender: self)
    }
    
    @IBAction func setting(_ sender: UIButton) {
        performSegue(withIdentifier: "ToSetting", sender: self)
    }
 
}
