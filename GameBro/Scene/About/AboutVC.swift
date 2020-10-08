//
//  AboutVC.swift
//  GameBro
//
//  Created by Ariel Theodore W on 09/10/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import UIKit

class AboutVC: BaseViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userMailLabel: UILabel!
    @IBOutlet weak var userDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    private func setupData() {
        userImage.image = UIImage(named: "ariltw")
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = userImage.bounds.width / 2
        userImage.layer.borderWidth = 2
        userImage.layer.shadowColor = UIColor.darkGray.cgColor
        
        userNameLabel.text = "Ariel Theodore Wairisal"
        userMailLabel.text = "ariltw@live.com"
        userDescriptionLabel.text = "Software Engineer"
    }
}
