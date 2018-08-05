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
    
    var gameType: Int!
    var slides:[Slide] = [];
    var games = [
        [
            Games(title: "เลือกหัวข้อ", description: "เลือกหัวข้อวาดภาพเพื่อเริ่มเล่นเกม", gif: "1เข้าวาด.gif"),
            Games(title: "เริ่มเล่นเกม", description: "วาดภาพตามโจทย์ที่กำหนด เมื่อวาดเสร็จให้เลือกไปที่ปุ่มส่งคำตอบ", gif: "เป็ด.jpg"),
            Games(title: "สรุปผลคะแนน", description: "เมื่อต้องการเริ่มเล่นใหม่ให้เลือกปุ่มเริ่มเล่นใหม่อีกครั้ง และเมื่อต้องการกลับไปหน้าหลักให้เลือกปุ่มกลับไปหน้าหลัก", gif: "ไก่.jpg")
        ],
        [
            Games(title: "เลือกหัวข้อ", description: "เลือกหัวข้อทายภาพเพื่อเริ่มเล่นเกม", gif: "เข้าเกมทายภาพ"),
            Games(title: "เริ่มเล่นเกม", description: "เลือกคำตอบเพียงข้อเดียวจากตัวเลือกที่กำหนดให้", gif: "เข้าเกมทายภาพ"),
            Games(title: "สรุปผลคะแนน", description: "เมื่อต้องการเริ่มเล่นใหม่ให้เลือกปุ่มเริ่มเล่นใหม่อีกครั้ง และเมื่อต้องการกลับไปหน้าหลักให้เลือกปุ่มกลับไปหน้าหลัก", gif: "คะแนนเกมทายภาพ")
        ],
        [
            Games(title: "เลือกหัวข้อ", description: "เลือกหัวข้อทายเสียงเพื่อเริ่มเล่นเกม", gif: ""),
            Games(title: "เริ่มเล่นเกม", description: "เลือกคำตอบเพียงข้อเดียวจากตัวเลือกที่กำหนดให้", gif: ""),
            Games(title: "สรุปผลคะแนน", description: "เมื่อต้องการเริ่มเล่นใหม่ให้เลือกปุ่มเริ่มเล่นใหม่อีกครั้ง และเมื่อต้องการกลับไปหน้าหลักให้เลือกปุ่มกลับไปหน้าหลัก", gif: "")
        ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        slides = createSlides(game: games[gameType])
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: pageControl)
    }
    func createSlides(game: [Games]) -> [Slide] {
        var tempSlide:[Slide] = [];
        for item in game {
            let slide:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            let imageGif = UIImage.gifImageWithName(item.gif)
            slide.imageView.image = UIImageView(image: imageGif).image
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
            slides[i].frame = CGRect(x: scrollView.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width - 20, height: scrollView.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    

}
