//
//  DrawViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {
    
    var getQuestion: DrawQuestion!
    var questionType: TypeDrawQuestion!
    
    @IBOutlet weak var blueColorBtn: UIButton!
    @IBOutlet weak var greenColorBtn: UIButton!
    @IBOutlet weak var yellowColorBtn: UIButton!
    @IBOutlet weak var redColorBtn: UIButton!
    @IBOutlet weak var blackColorBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        [redColorBtn, yellowColorBtn, greenColorBtn, blueColorBtn].forEach { (colorBtn) in
            colorBtn?.transform.translatedBy(x: blackColorBtn.center.x - colorBtn!.center.x, y: 0)
            colorBtn?.alpha = 0
        }
        navigationItem.hidesBackButton = true
    }
    
    func resetColorButtons() {
        [blackColorBtn, redColorBtn, yellowColorBtn, greenColorBtn, blueColorBtn].forEach { (colorBtn) in
           
        }
    }

    @IBAction func tappedBlackColor(_ sender: UIButton) {
        sender.playButtonSound()
        var delay = 0.1
        [redColorBtn, yellowColorBtn, greenColorBtn, blueColorBtn].forEach { (colorBtn) in
            UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: {
                colorBtn?.transform = CGAffineTransform.identity
                colorBtn?.alpha = 1
            })
            delay += 0.1
        }
    }
    


}
