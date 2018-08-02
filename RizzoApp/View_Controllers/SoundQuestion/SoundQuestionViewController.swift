//
//  SoundQuestionViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit
import AVFoundation

class SoundQuestionViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleQuestionImageView: UIImageView!
    @IBOutlet weak var currentQuestionLbl: UILabel!
    @IBOutlet var answersButton: [UIButton]!
    var getQuestions = [SoundQuestion]()
    var questions = [SoundQuestion]()
    var questionType: TypeSoundQuestion!
    var currentQuestion = 1
    var soundQuestion: SoundQuestion!
    var soundPlayer: AVAudioPlayer?
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppManager.shared.stopBackgroundSound()
        navigationItem.hidesBackButton = true
        setNavigationBar()
        containerView.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        switch questionType {
        case .animal:
            titleQuestionImageView.image = #imageLiteral(resourceName: "SoundQuestion/header_animal")
            
        case .musical:
            titleQuestionImageView.image = #imageLiteral(resourceName: "SoundQuestion/header_musical")
        default:
            break
        }
        currentQuestionLbl.textColor = AppManager.shared.currentTheme?.fontColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questions = getQuestions
        score = 0
        currentQuestion = 1
        setView()
        var delay = 0.045
        for button in self.answersButton.reversed() {
            button.popIn(delay: delay)
            delay += 0.045
        }
    }
    
    func setView() {
        for button in self.answersButton {
            button.isUserInteractionEnabled = true
        }
        currentQuestionLbl.text = "ข้อที่: \(currentQuestion) / 10"
        setQuestionDataToView()
    }
    
    func setQuestionDataToView() {
        if !questions.isEmpty {
            let random = Int(arc4random_uniform(UInt32(questions.count)))
            soundQuestion = questions.remove(at: random)
            print("คำตอบของคำถามปัจจุบัน: \(soundQuestion.answer)")
            for (index, answer) in soundQuestion.answers.enumerated() {
                answersButton[index].setTitle(answer, for: .normal)
            }
            setSoundForPlayer(nameSound: soundQuestion.answer)
            var delay = 0.045
            for button in self.answersButton.reversed() {
                button.popIn(delay: delay)
                delay += 0.045
            }
        }
    }
    
    func setSoundForPlayer(nameSound: String) {
        guard let url = Bundle.main.url(forResource: nameSound, withExtension: "mp3") else {
            return
        }
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
        }catch {
            return
        }
    }
    
    @IBAction func backtoSoundQuestion(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func tappedAnswerButton(_ sender: UIButton) {
        sender.playButtonSound()
        let modalView = Bundle.main.loadNibNamed("ModalView", owner: self, options: nil)!.first as! ModalView
        containerView.addSubview(modalView)
        modalView.setup(center: containerView.center, size: CGSize(width: containerView.frame.width - 20, height: containerView.frame.height / 1.5))
        modalView.alpha = 0
        
        let title = sender.currentTitle!
        if title == soundQuestion.answer {
            modalView.backgroundImage.image = AppManager.shared.currentTheme?.modalCorrectBgImage
            score += 1
            print("ถูก")
        }
        else {
            modalView.backgroundImage.image = AppManager.shared.currentTheme?.modalIncorrectBgImage
            print("ผิด")
        }
        modalView.nextButton.setBackgroundImage(AppManager.shared.currentTheme?.modalNextBtn, for: .normal)
        for button in answersButton {
            button.isUserInteractionEnabled = false
        }
        modalView.isAnswerLabel.text = "คำตอบคือ \(soundQuestion.answer)"
        modalView.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            modalView.alpha = 1
            modalView.transform = CGAffineTransform.identity
        })
        modalView.callBack = { [unowned self] in
            UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                modalView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                modalView.alpha = 0
            }, completion: { (true) in
                modalView.removeFromSuperview()
                if !self.questions.isEmpty {
                    self.currentQuestion += 1
                    UIView.animate(withDuration: 0.5, animations: {
                        self.containerView.alpha = 0
                    }, completion: { (true) in
                        self.setView()
                        UIView.animate(withDuration: 0.5, animations: {
                            self.containerView.alpha = 1
                        })
                    })
                }
                else {
                    print("จบ")
                    print(self.score)
                    self.performSegue(withIdentifier: "ToFinishedSoundQuestion", sender: self)
                }
            })
        }
    }
    
    @IBAction func tappedSoundBtn(_ sender: UIButton) {
        soundPlayer?.stop()
        soundPlayer?.currentTime = 0
        soundPlayer?.play()
        if let duration = soundPlayer?.duration {
            sender.pulsate(duration)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navDestination = segue.destination as? UINavigationController,
            let destination = navDestination.viewControllers.first as? FinishedSoundQViewController {
            destination.getScore = score
            
        }
    }
    
    
}
