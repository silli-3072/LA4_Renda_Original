//
//  PlayViewController.swift
//  Renda_Original
//
//  Created by 春田実利 on 2022/08/30.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    @IBOutlet var Button: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var countTimer:Float = 0.0
    var countNumber:Int = 0
    
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Button.layer.borderColor = UIColor.black.cgColor
        Button.layer.borderWidth = 5.0
        
        backButton.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapButton() {
        countNumber = countNumber + 1
        countLabel.text = String(countNumber)
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
        if countTimer <= 5.00 {
            timerLabel.isHidden = false
        } else {
            timerLabel.isHidden = true
        }
        
        if countNumber >= 100 {
            timer.invalidate()
            timerLabel.isHidden = false
            Button.isEnabled = false
            backButton.isHidden = false
            
            if countTimer == 30.0 {
                commentLabel.textColor = UIColor.red
                commentLabel.text = "PERFECT"
            } else if countTimer >= 27.0 && countTimer <= 33.0  {
                commentLabel.textColor = UIColor.yellow
                commentLabel.text = "GREAT"
            } else if countTimer >= 25.0 && countTimer <= 35.0  {
                commentLabel.textColor = UIColor.green
                commentLabel.text = "GOOD"
            } else {
                commentLabel.textColor = UIColor.black
                commentLabel.text = ""
            }
            
        }
        
        
        
        
    }
    
    @objc func up() {
        countTimer = countTimer + 0.01
        timerLabel.text = String(format: "%.2f秒", countTimer)
        
        //timerLabel.isHidden = true
    }
    
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
