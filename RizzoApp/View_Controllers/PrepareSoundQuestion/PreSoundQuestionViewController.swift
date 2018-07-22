//
//  PreSoundQuestionViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class PreSoundQuestionViewController: UIViewController {

    var questions: [SoundQuestion]?
    var questionType: TypeQuestion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }

    @IBAction func tappedCategory(_ sender: UIButton) {
        sender.playButtonSound()
        QuestionModel.getAllSoundQuestion { (datas) in
            self.questions = datas[sender.tag]
            self.questionType = sender.tag == 0 ? .animal : .musical
            self.performSegue(withIdentifier: "ToSoundQuestion", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SoundQuestionViewController {
            destination.question = self.questions
            destination.questionType = self.questionType
        }
    }

}
