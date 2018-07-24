//
//  ImgQuestionViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class ImgQuestionViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleQuestionImageView: UIImageView!
    @IBOutlet weak var imgQuestionImageView: UIImageView!
    @IBOutlet weak var currentQuestionLbl: UILabel!
    @IBOutlet var answersButton: [UIButton]!
    var getQuestions = [ImageQuestion]()
    var questions = [ImageQuestion]()
    var questionType: TypeImageQuestion!
    var currentQuestion = 1
    var imageQuestion: ImageQuestion!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        containerView.backgroundColor = #colorLiteral(red: 0.898, green: 0.7098, blue: 0.8314, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.898, green: 0.7098, blue: 0.8314, alpha: 1)
        switch questionType {
            case .fruit:
                titleQuestionImageView.image = #imageLiteral(resourceName: "f2ChoiceImgsQues/night_headerImgFruitsQues")
            case .animal:
                titleQuestionImageView.image = #imageLiteral(resourceName: "f2ChoiceImgsQues/night_headerImgAnimalsQues")
            case .place:
                titleQuestionImageView.image = #imageLiteral(resourceName: "f2ChoiceImgsQues/night_headerImgLocationsQues")
            case .object:
                titleQuestionImageView.image = #imageLiteral(resourceName: "f2ChoiceImgsQues/night_headerImgObjectQues")
            default:
                break
        }
        navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questions = getQuestions
        score = 0
        currentQuestion = 1
        setView()
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
            imageQuestion = questions.remove(at: random)
            print("คำตอบของคำถามปัจจุบัน: \(imageQuestion.answer)")
            for (index, answer) in imageQuestion.answers.enumerated() {
                answersButton[index].setTitle(answer, for: .normal)
            }
            setImageForPlayer(nameImg: imageQuestion.answer)
        }
    }
    
    func setImageForPlayer(nameImg: String) {
        imgQuestionImageView.image = UIImage(named:"\(nameImg).jpg")
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
        if title == imageQuestion.answer {
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
        modalView.isAnswerLabel.text = "คำตอบคือ \(imageQuestion.answer)"
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
                    self.performSegue(withIdentifier: "ToFinishedImgQuestion", sender: self)
                }
            })
        }
    }
    
    @IBAction func previewQuestionImage(_ sender: UIButton) {
        sender.playButtonSound()
        let previewImage = Bundle.main.loadNibNamed("PreviewImage", owner: self, options: nil)!.first as! PreviewImage
        previewImage.bounds.size = CGSize(width: view.bounds.width - 20, height: view.bounds.height - 20)
        previewImage.center = view.center
        previewImage.imageView.image = UIImage(named: "\(imageQuestion.answer).jpg")
        view.addSubview(previewImage)
        previewImage.alpha = 0
        previewImage.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            previewImage.alpha = 1
            previewImage.transform = CGAffineTransform.identity
        })
        previewImage.callback = {
            UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                previewImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                previewImage.alpha = 0
            }, completion: { (true) in
                previewImage.removeFromSuperview()
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navDestination = segue.destination as? UINavigationController,
            let destination = navDestination.viewControllers.first as? FinishedImgQViewController {
            destination.getScore = score
            
        }
    }
    
    @IBAction func backToImageQuestion(segue: UIStoryboardSegue) {
        
    }
}
