//
//  SoundQuestionViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class SoundQuestionViewController: UIViewController {

    var question: [SoundQuestion]?
    var questionType: TypeQuestion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = #colorLiteral(red: 0.898, green: 0.7098, blue: 0.8314, alpha: 1)
        setNavigationBar()
    }

//    @IBAction func finishedSoundQuestion(_ sender: UIButton) {
//        performSegue(withIdentifier: "ToFinishedSoundQuestion", sender: self)
//    }
    
    @IBAction func backtoSoundQuestion(segue: UIStoryboardSegue) {
        
    }
    
}
