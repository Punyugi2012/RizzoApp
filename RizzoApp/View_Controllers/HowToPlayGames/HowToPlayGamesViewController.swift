//
//  HowToPlayGamesViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 4/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

class HowToPlayGamesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func next(_ sender: UIButton) {
        performSegue(withIdentifier: "ToHowToPlay", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HowToPlayViewController {
            let backItem = UIBarButtonItem()
            backItem.title = "ย้อนกลับ"
            backItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "THSarabunNew-Bold", size: 35)!], for: .normal)
            navigationItem.backBarButtonItem = backItem
            destination.navigationItem.backBarButtonItem = backItem
        }
    }

}
