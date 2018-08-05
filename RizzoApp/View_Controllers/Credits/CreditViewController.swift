//
//  CreditViewController.swift
//  RizzoApp
//
//  Created by punyawee  on 4/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import UIKit

struct Developer {
    var name: String
    var roles: [String]
}

class CreditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var developers = [
        Developer(name: "ธุรกิจ เชยเล็ก", roles: ["Tester", "Designer"]),
        Developer(name: "วรวุฒิ สง่างาม", roles: ["Provider", "Designer"]),
        Developer(name: "อนันต์ชัย มั่นคง", roles: ["Designer"]),
        Developer(name: "ศีระ แก่นแก้ว ", roles: ["Designer", "Programmer"]),
        Developer(name: "ทศพร สุขอนันต์", roles: ["Tester", "Designer"]),
        Developer(name: "ปุณยวีร์ เจริญท้าว", roles: ["Programmer"]),
        Developer(name: "ปภาวรินท์ มากเจริญ", roles: ["Provider"]),
        Developer(name: "อรนุช ตาดำ", roles: ["Provider"]),
        Developer(name: "วริศรา ศรีอรุณรัตนากร", roles: ["Provider"]),
        Developer(name: "สิทธิศักดิ์ เถื่อนพนม", roles: ["Provider"])
    ]
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        myTableView.dataSource = self
        myTableView.delegate = self
        if !AppManager.shared.get(key: isLightThemeKey) {
            view.backgroundColor = AppManager.shared.currentTheme?.backgroundColor
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return developers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let developerCell = tableView.dequeueReusableCell(withIdentifier: "DeveloperCell", for: indexPath) as! DeveloperTableViewCell
        developerCell.name.text = developers[indexPath.row].name
        developerCell.name.textColor = AppManager.shared.currentTheme?.fontColor
        developerCell.role.subviews.forEach { (subView) in
            subView.removeFromSuperview()
        }
        developers[indexPath.row].roles.forEach { (role) in
            let imageView = UIImageView(image: UIImage(named: "Credit/\(role)"))
            imageView.frame.size = CGSize(width: 80, height: 80)
            imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
            imageView.backgroundColor = UIColor.darkGray
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleToFill
            developerCell.role.addArrangedSubview(imageView)
        }
        return developerCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


