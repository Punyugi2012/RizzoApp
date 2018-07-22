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
    var questionType: TypeQuestion!
    var currentQuestion = 1
    var soundQuestion: SoundQuestion!
    var soundPlayer: AVAudioPlayer?
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppManager.shared.stopBackgroundSound()
        navigationItem.hidesBackButton = true
        setNavigationBar()
        containerView.backgroundColor = #colorLiteral(red: 0.898, green: 0.7098, blue: 0.8314, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.898, green: 0.7098, blue: 0.8314, alpha: 1)
        switch questionType {
        case .animal:
            titleQuestionImageView.image = #imageLiteral(resourceName: "f3soundQ/headerSndAnimals")
            
        case .musical:
            titleQuestionImageView.image = #imageLiteral(resourceName: "f3soundQ/headerSndMusicInstruments")
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questions = getQuestions
        score = 0
        setView()
    }

//    @IBAction func finishedSoundQuestion(_ sender: UIButton) {
//        performSegue(withIdentifier: "ToFinishedSoundQuestion", sender: self)
//    }
    
    func setView() {
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
        modalView.center.x = containerView.center.x
        modalView.center.y = containerView.center.y - 50
        modalView.bounds.size.width = containerView.bounds.width - 20
        modalView.bounds.size.height = containerView.bounds.height / 1.5
        modalView.alpha = 0
        
        let title = sender.currentTitle!
        if title == soundQuestion.answer {
            modalView.backgroundImage.image = #imageLiteral(resourceName: "modal/modalCorrect")
            score += 1
            print("ถูก")
        }
        else {
             modalView.backgroundImage.image = #imageLiteral(resourceName: "modal/modalIncorrct")
            print("ผิด")
        }
        for button in answersButton {
            button.isUserInteractionEnabled = false
        }
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
                        for button in self.answersButton {
                            button.isUserInteractionEnabled = true
                        }
                        UIView.animate(withDuration: 0.5, animations: {
                            self.containerView.alpha = 1
                        })
                    })
                }
                else {
                    print("จบ")
                    print(self.score)
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
    
    
}
