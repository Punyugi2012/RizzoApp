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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        print(question!)
    }

//    @IBAction func finishedSoundQuestion(_ sender: UIButton) {
//        performSegue(withIdentifier: "ToFinishedSoundQuestion", sender: self)
//    }
    
    @IBAction func backtoSoundQuestion(segue: UIStoryboardSegue) {
        
    }
    
}
