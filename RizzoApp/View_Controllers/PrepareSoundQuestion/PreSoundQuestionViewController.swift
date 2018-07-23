//
//  PreSoundQuestionViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class PreSoundQuestionViewController: UIViewController {

    @IBOutlet weak var myLoadView: UIActivityIndicatorView!
    
    var questions = [SoundQuestion]()
    var questionType: TypeQuestion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        myLoadView.transform = CGAffineTransform(scaleX: 2, y: 2)
        myLoadView.stopAnimating()
    }
    
    func chooseQuestion(_ questions: [SoundQuestion]) -> [SoundQuestion] {
        var questionsForChoose = questions
        var tmpArray = [SoundQuestion]()
        if questions.count >= 10 {
            for _ in 1...10 {
                let random = Int(arc4random_uniform(UInt32(questionsForChoose.count)))
                tmpArray.append(questionsForChoose.remove(at: random))
            }
        }
        return tmpArray
    }

    @IBAction func tappedCategory(_ sender: UIButton) {
        sender.playButtonSound()
        myLoadView.startAnimating()
        QuestionModel.getAllSoundQuestion { (datas) in
            self.myLoadView.stopAnimating()
            self.questions = self.chooseQuestion(datas[sender.tag])
            self.questionType = sender.tag == 0 ? .animal : .musical
            self.performSegue(withIdentifier: "ToSoundQuestion", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SoundQuestionViewController {
            destination.getQuestions = self.questions
            destination.questionType = self.questionType
        }
    }

}
