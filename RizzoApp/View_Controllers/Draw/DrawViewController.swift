//
//  DrawViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit
import Alamofire

class DrawViewController: UIViewController {
    
    var getQuestion: DrawQuestion!
    var questionType: TypeDrawQuestion!
    var isCorrect = false
    
    @IBOutlet weak var myLoader: UIActivityIndicatorView!
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var titleQuestionLbl: UILabel!
    @IBOutlet weak var smallLineHeight: NSLayoutConstraint!
    @IBOutlet weak var mediumLineHight: NSLayoutConstraint!
    @IBOutlet weak var highLineHeight: NSLayoutConstraint!
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
        highLineHeight.constant = 170
        navigationItem.hidesBackButton = true
        view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        myLoader.transform = CGAffineTransform(scaleX: 2, y: 2)
        myLoader.stopAnimating()
        setDrawViewDefault()
        setQuestionDataToView()
    }
    
    func setDrawViewDefault() {
        drawView.currentWidth = 6
        drawView.currentStrockColor = UIColor.black.cgColor
        drawView.layer.cornerRadius = 20
        drawView.clipsToBounds = true
        drawView.backgroundColor = AppManager.shared.currentTheme?.viewBackgroundColor
    }
    
    func setQuestionDataToView() {
        titleQuestionLbl.text = "จงวาด\(getQuestion.questionName)"
    }
    
    func resetColorButtons() {
        let orderColors = ["black", "red", "yellow", "green", "blue"]
        var index = 0
        [blackColorBtn, redColorBtn, yellowColorBtn, greenColorBtn, blueColorBtn].forEach { (colorBtn) in
           colorBtn?.setBackgroundImage(UIImage(named: "Draw/\(orderColors[index])"), for: .normal)
            index += 1
        }
    }
    
    func resetLineButtons() {
        [highLineHeight, mediumLineHight, smallLineHeight].forEach { (lineBtnHight) in
            lineBtnHight?.constant = 140
        }
    }

    @IBAction func tappedBlackColor(_ sender: UIButton) {
        drawView.currentStrockColor = UIColor.black.cgColor
        print("BackColor")
        sender.playButtonSound()
        resetColorButtons()
        sender.setBackgroundImage(UIImage(named: "Draw/blacked"), for: .normal)
    }
    
    @IBAction func tappedRedColor(_ sender: UIButton) {
        drawView.currentStrockColor = #colorLiteral(red: 0.8078, green: 0.0392, blue: 0.1412, alpha: 1)
        print("RedColor")
        sender.playButtonSound()
        resetColorButtons()
        sender.setBackgroundImage(UIImage(named: "Draw/reded"), for: .normal)
    }
    
    @IBAction func tappedYellowColor(_ sender: UIButton) {
        drawView.currentStrockColor = #colorLiteral(red: 0.9686, green: 0.898, blue: 0.2314, alpha: 1)
        print("YellowColor")
        sender.playButtonSound()
        resetColorButtons()
        sender.setBackgroundImage(UIImage(named: "Draw/yellowed"), for: .normal)
    }
    
    @IBAction func tappedGreenColor(_ sender: UIButton) {
        drawView.currentStrockColor = #colorLiteral(red: 0.5059, green: 0.8196, blue: 0.2078, alpha: 1)
        print("GreenColor")
        sender.playButtonSound()
        resetColorButtons()
        sender.setBackgroundImage(UIImage(named: "Draw/greened"), for: .normal)
    }
    
    @IBAction func tappedBlueColor(_ sender: UIButton) {
        drawView.currentStrockColor = #colorLiteral(red: 0.3059, green: 0.5725, blue: 0.8745, alpha: 1)
        print("BlueColor")
        sender.playButtonSound()
        resetColorButtons()
        sender.setBackgroundImage(UIImage(named: "Draw/blued"), for: .normal)
    }

    @IBAction func tappedHighLineBtn(_ sender: UIButton) {
        drawView.currentWidth = 6
        print("HeighLine")
        sender.playButtonSound()
        resetLineButtons()
        highLineHeight.constant = 170
    }
    
    @IBAction func tappedMediumLineBtn(_ sender: UIButton) {
        drawView.currentWidth = 4
        print("MediumLine")
        sender.playButtonSound()
        resetLineButtons()
        mediumLineHight.constant = 170
        
    }
    @IBAction func tappedSmallLineBtn(_ sender: UIButton) {
        drawView.currentWidth = 2
        print("SmallLine")
        sender.playButtonSound()
        resetLineButtons()
        smallLineHeight.constant = 170
        
    }
  
    @IBAction func tappedSentBtn(_ sender: UIButton) {
        sender.playButtonSound()
        print("SentButton")
        var datas = [[CGFloat]]()
        datas.append([])
        datas.append([])
        for stroke in self.drawView.strokes {
            datas[0].append(stroke.lastPoint.x)
            datas[1].append(stroke.lastPoint.y)
        }
        let parameters: Parameters = [
            "input_type": 0,
            "requests": [
                [
                    "language": "quickdraw",
                    "writing_guide": [
                        "width": self.drawView.frame.width,
                        "height": self.drawView.frame.height
                    ],
                    "ink": [
                        datas
                    ]
                ]
            ]
        ]
        myLoader.startAnimating()
        DrawAPI.checkDrawed(params: parameters) { (results) in
            self.myLoader.stopAnimating()
            for result in results {
                if result.contains(self.getQuestion.answer) {
                    self.isCorrect = true
                    break
                }
            }
            self.performSegue(withIdentifier: "ToFinishedDraw", sender: self)
            print(results)
        }
        
    }
    @IBAction func tappedUndoBtn(_ sender: UIButton) {
        sender.playButtonSound()
        drawView.undo()
        print("UndoButton")
    }
    @IBAction func tappedClearBtn(_ sender: UIButton) {
        sender.playButtonSound()
        print("ClearButton")
        drawView.clearDraw()
    }
    @IBAction func backToDraw(segue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navDestination = segue.destination as? UINavigationController, let destination = navDestination.viewControllers.first as? FinishedDrawViewController {
            destination.isCorrect = self.isCorrect
            destination.getQuestionName = self.getQuestion.questionName
            destination.getDrawedImage = UIImage.getImage(view: drawView)
            self.isCorrect = false
        }
    }
    @IBAction func previewQuestionImage(_ sender: UIButton) {
        sender.playButtonSound()
        let previewImage = Bundle.main.loadNibNamed("PreviewImage", owner: self, options: nil)!.first as! PreviewImage
        previewImage.setup(center: view.center, size: CGSize(width: view.bounds.width - 20, height: view.bounds.height - 30))
        previewImage.imageView.image = UIImage(named: "\(getQuestion.questionName).png")
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
}
