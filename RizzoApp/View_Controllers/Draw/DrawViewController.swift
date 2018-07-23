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
    
    @IBOutlet weak var smallLineHeight: NSLayoutConstraint!
    @IBOutlet weak var mediumLineHight: NSLayoutConstraint!
    @IBOutlet weak var highLineHeight: NSLayoutConstraint!
    @IBOutlet weak var penBtn: UIButton!
    @IBOutlet weak var blueColorBtn: UIButton!
    @IBOutlet weak var greenColorBtn: UIButton!
    @IBOutlet weak var yellowColorBtn: UIButton!
    @IBOutlet weak var redColorBtn: UIButton!
    @IBOutlet weak var blackColorBtn: UIButton!
    @IBOutlet weak var smallLineBtn: UIButton!
    @IBOutlet weak var mediumLineBtn: UIButton!
    @IBOutlet weak var highLineBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(questionType)
        print(getQuestion)
        setNavigationBar()
        blackColorBtn.alpha = 0
        penBtn.alpha = 0
        highLineBtn.alpha = 0
        [redColorBtn, yellowColorBtn, greenColorBtn, blueColorBtn].forEach { (colorBtn) in
            colorBtn?.transform.translatedBy(x: blackColorBtn.center.x - colorBtn!.center.x, y: 0)
            colorBtn?.alpha = 0
        }
        [smallLineBtn, mediumLineBtn].forEach { (lineBtn) in
            lineBtn?.transform.translatedBy(x: highLineBtn.center.x - lineBtn!.center.x, y: 0)
            lineBtn?.alpha = 0
        }
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(named: "DayColor")
    }
    
    func resetColorButtons() {
        let orderColors = ["black", "red", "yellow", "green", "blue"]
        var index = 0
        [blackColorBtn, redColorBtn, yellowColorBtn, greenColorBtn, blueColorBtn].forEach { (colorBtn) in
           colorBtn?.setBackgroundImage(UIImage(named: "\(orderColors[index])"), for: .normal)
            index += 1
        }
    }
    
    func resetLineButtons() {
        [highLineHeight, mediumLineHight, smallLineHeight].forEach { (lineBtnHight) in
            lineBtnHight?.constant = 140
        }
    }

    @IBAction func tappedBlackColor(_ sender: UIButton) {
        sender.playButtonSound()
        resetColorButtons()
        sender.setBackgroundImage(UIImage(named: "blacked"), for: .normal)
        var delay = 0.1
        [yellowColorBtn, greenColorBtn, blueColorBtn, redColorBtn].forEach { (colorBtn) in
            UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: {
                colorBtn?.transform = CGAffineTransform.identity
                colorBtn?.alpha = 1
            })
            delay += 0.1
        }
    }
    
    @IBAction func tappedRedColor(_ sender: UIButton) {
        sender.playButtonSound()
        resetColorButtons()
        penBtn.setBackgroundImage(UIImage(named: "redpen"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "reded"), for: .normal)
    }
    
    @IBAction func tappedYellowColor(_ sender: UIButton) {
        sender.playButtonSound()
        resetColorButtons()
        penBtn.setBackgroundImage(UIImage(named: "yellowpen"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "yellowed"), for: .normal)
    }
    
    @IBAction func tappedGreenColor(_ sender: UIButton) {
        sender.playButtonSound()
        resetColorButtons()
        penBtn.setBackgroundImage(UIImage(named: "greenpen"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "greened"), for: .normal)
    }
    
    @IBAction func tappedBlueColor(_ sender: UIButton) {
        sender.playButtonSound()
        resetColorButtons()
        penBtn.setBackgroundImage(UIImage(named: "bluepen"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "blued"), for: .normal)
    }

    @IBAction func tappedHighLineBtn(_ sender: UIButton) {
        sender.playButtonSound()
        resetLineButtons()
        highLineHeight.constant = 170
        var delay = 0.1
        [mediumLineBtn, smallLineBtn].forEach { (lineBtn) in
            UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: {
                lineBtn?.transform = CGAffineTransform.identity
                lineBtn?.alpha = 1
            })
            delay += 0.1
        }
        
    }
    
    @IBAction func tappedMediumLineBtn(_ sender: UIButton) {
        sender.playButtonSound()
        resetLineButtons()
        mediumLineHight.constant = 170
        
    }
    @IBAction func tappedSmallLineBtn(_ sender: UIButton) {
        sender.playButtonSound()
        resetLineButtons()
        smallLineHeight.constant = 170
        
    }
    @IBAction func tappedPenBtn(_ sender: UIButton) {
        
        
    }
    @IBAction func tappedOpenTools(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.penBtn.alpha = 1
            self.highLineBtn.alpha = 1
            self.blackColorBtn.alpha = 1
        }
    }
}
