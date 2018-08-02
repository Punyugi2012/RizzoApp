//
//  PreImgQuestionViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class PreImgQuestionViewController: UIViewController {
    
    @IBOutlet var categoryButtons: [UIButton]!
    @IBOutlet weak var myLoader: UIActivityIndicatorView!
    var questions = [ImageQuestion]()
    var questionType: TypeImageQuestion!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        myLoader.transform = CGAffineTransform(scaleX: 2, y: 2)
        myLoader.stopAnimating()
        myLoader.color = AppManager.shared.currentTheme?.fontColor
        if !AppManager.shared.get(key: isLightThemeKey) {
            view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        }
        var delay = 0.15
        for button in categoryButtons {
            button.popIn(delay: delay)
            delay += 0.15
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func chooseQuestion(_ questions: [ImageQuestion]) -> [ImageQuestion] {
        var questionsForChoose = questions
        var tmpArray = [ImageQuestion]()
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
        myLoader.startAnimating()
        QuestionModel.getAllImageQuestion { (datas) in
            self.myLoader.stopAnimating()
            self.questions = self.chooseQuestion(datas[sender.tag])
            self.questionType = self.getType(number: sender.tag)
            self.performSegue(withIdentifier: "ToImgQuestion", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ImgQuestionViewController {
            destination.getQuestions = self.questions
            destination.questionType = self.questionType
        }
    }
    
    func getType(number: Int) -> TypeImageQuestion?{
        switch number {
        case 0:
            return .fruit
        case 1:
            return .animal
        case 2:
            return .place
        case 3:
            return .object
        default:
            return nil
        }
    }

}
