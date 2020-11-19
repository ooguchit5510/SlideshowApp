//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 大口大嘉 on 2020/11/02.
//  Copyright © 2020 taiga.ooguchi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imageName)
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
