//
//  HowToPlayViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 4/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit
struct Games {
    var title: String
    var description: String
    var gif: String
}
class HowToPlayViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var offSet: CGFloat = 0
    var gameType: Int!
    var slides:[Slide] = [];
    var games = [
        [
            Games(title: "เลือกหัวข้อ", description: "เลือกหัวข้อวาดภาพเพื่อเริ่มเล่นเกม", gif: "เลือกหัวข้อวาดภาพ"),
            Games(title: "เริ่มเล่นเกม", description: "วาดภาพตามโจทย์ที่กำหนด เมื่อวาดเสร็จให้เลือกไปที่ปุ่มส่งคำตอบ", gif: "วาดภาพ"),
            Games(title: "สรุปผลคะแนน", description: "เมื่อต้องการเริ่มเล่นเกมใหม่ให้เลือกปุ่มเริ่มเล่นใหม่อีกครั้ง และเมื่อต้องการกลับไปยังหน้าหลักให้เลือกปุ่มกลับไปหน้าหลัก", gif: "สรุปผลการวาดภาพ")
        ],
        [
            Games(title: "เลือกหัวข้อ", description: "เลือกหัวข้อทายภาพเพื่อเริ่มเล่นเกม", gif: "เลือกหัวข้อทายภาพ"),
            Games(title: "เริ่มเล่นเกม", description: "เลือกปุ่มคำตอบเพียงข้อเดียวจากตัวเลือกที่กำหนดให้", gif: "ทายภาพ"),
            Games(title: "สรุปผลคะแนน", description: "เมื่อต้องการเริ่มเล่นเกมใหม่ให้เลือกปุ่มเริ่มเล่นใหม่อีกครั้ง และเมื่อต้องการกลับไปยังหน้าหลักให้เลือกปุ่มกลับไปหน้าหลัก", gif: "สรุปผลการทายภาพ")
        ],
        [
            Games(title: "เลือกหัวข้อ", description: "เลือกหัวข้อทายเสียงเพื่อเริ่มเล่นเกม", gif: "เลือกหัวข้อทายเสียง"),
            Games(title: "เริ่มเล่นเกม", description: "เลือกปุ่มคำตอบเพียงข้อเดียวจากตัวเลือกที่กำหนดให้", gif: "ทายเสียง"),
            Games(title: "สรุปผลคะแนน", description: "เมื่อต้องการเริ่มเล่นเกมใหม่ให้เลือกปุ่มเริ่มเล่นใหม่อีกครั้ง และเมื่อต้องการกลับไปยังหน้าหลักให้เลือกปุ่มกลับไปหน้าหลัก", gif: "สรุปผลการทายเสียง")
        ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.offSet = 0
        //        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        //
        scrollView.delegate = self
        pageControl.layer.cornerRadius = 20
        
        slides = createSlides(game: games[gameType])
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        view.bringSubview(toFront: pageControl)
    }
    func createSlides(game: [Games]) -> [Slide] {
        var tempSlide:[Slide] = [];
        for item in game {
            let slide:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide.imageView.loadGif(name: item.gif)
            slide.labelTitle.text = item.title
            slide.labelDescription.text = item.description
            tempSlide.append(slide)
        }
        return tempSlide
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        //        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(slides.count), height: 1.0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    @objc func autoScroll() {
        let totalPossibleOffset = CGFloat(slides.count - 1) * self.view.bounds.size.width
        if offSet == totalPossibleOffset {
            offSet = 0 // come back to the first image after the last image
        }
        else {
            offSet += self.view.bounds.size.width
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.x = CGFloat(self.offSet)
            }, completion: nil)
        }
    }
    
}
