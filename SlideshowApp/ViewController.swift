//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 大口大嘉 on 2020/11/02.
//  Copyright © 2020 taiga.ooguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    let images = ["image1.jpg", "image2.jpg", "image3.jpg"]

    var imageNo = 0
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: images[imageNo])
        
        imageView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(toSecondVC))
        imageView.addGestureRecognizer(gesture)
        
    }
    
    
    @IBAction func forward(_ sender: Any) {
        imageNo += 1
        if imageNo >= images.count {
            imageNo = 0
        }
        
        imageView.image = UIImage(named: images[imageNo])
        
    }
    
    @IBAction func back(_ sender: Any) {
        imageNo -= 1
        if imageNo < 0 {
            imageNo = images.count - 1
        }
        
        imageView.image = UIImage(named: images[imageNo])
        
    }
    
    @IBAction func playStop(_ sender: Any) {
        if timer == nil {
            playTimer()
        } else {
            stopTimer()
        }
    }

    func playTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoForward), userInfo: nil, repeats: true)
        self.playStopButton.setTitle("停止", for: .normal)
        self.forwardButton.isEnabled = false
        self.backButton.isEnabled = false
    }

    func stopTimer() {
        self.timer.invalidate()
        self.timer = nil
        self.playStopButton.setTitle("再生", for: .normal)
        self.forwardButton.isEnabled = true
        self.backButton.isEnabled = true
    }
    
    @objc func autoForward() {
        imageNo += 1
        if imageNo >= images.count {
            imageNo = 0
        }
        
        print("autoForward imageNo:", imageNo)
        imageView.image = UIImage(named: images[imageNo])
    }
    
    @objc func toSecondVC() {
        print("tap")

        if timer != nil {
            stopTimer()
        }

        let secondVC = self.storyboard?.instantiateViewController(identifier: "second") as! SecondViewController
        secondVC.imageName = images[imageNo]
        self.present(secondVC, animated: true, completion: nil)
    }


}

