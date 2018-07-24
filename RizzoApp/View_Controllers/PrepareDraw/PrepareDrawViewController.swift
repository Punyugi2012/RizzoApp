//
//  PrepareDrawViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class PrepareDrawViewController: UIViewController {

    @IBOutlet weak var myLoader: UIActivityIndicatorView!
    var question: DrawQuestion!
    var questionType: TypeDrawQuestion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        myLoader.transform = CGAffineTransform(scaleX: 2, y: 2)
        myLoader.stopAnimating()
    }
    
    func chooseQuestion(_ questions: [DrawQuestion]) -> DrawQuestion  {
        if questions.count >= 1 {
            let random = Int(arc4random_uniform(UInt32(questions.count)))
            return questions[random]
        }
        return DrawQuestion(questionName: "", answer: "")
    }
    
    @IBAction func tappedCategory(_ sender: UIButton) {
        sender.playButtonSound()
        myLoader.startAnimating()
        QuestionModel.getAllDrawQuestion { (datas) in
            self.myLoader.stopAnimating()
            self.question = self.chooseQuestion(datas[sender.tag])
            if sender.tag == 0 {
                self.questionType = .animal
            }
            else if sender.tag == 1 {
                self.questionType = .object
            }
            else if sender.tag == 2 {
                self.questionType = .fruit
            }
            self.performSegue(withIdentifier: "ToDraw", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DrawViewController {
            destination.getQuestion = self.question
            destination.questionType = self.questionType
        }
    }
    
  
}
