//
//  ResultViewController.swift
//  Rushambo
//
//  Created by Youngsun Paik on 3/9/16.
//  Copyright © 2016 Youngsun Paik. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var user: String?
    var computer: String?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        displayResult()
    }
    
    func displayResult() {
        
        var text: String
        var imageName: String
        
        let losingCondition = (user == "Rock" && computer == "Paper") || (user == "Paper" && computer == "Scissors") || (user == "Scissors" && computer == "Rock")
        
        if user == computer {
            text = "It's a Tie"
            imageName = "ItsATie"
        } else if losingCondition {
            text = "You lost... \(user!) vs \(computer!)"
            imageName = "\(computer!)-\(user!)"
        } else {
            text = "You won! \(user!) vs \(computer!)"
            imageName = "\(user!)-\(computer!)"
        }
        
        resultLabel.text = text
        resultImage.image = UIImage(named: "\(imageName)")
    }

    
    @IBAction func playAgainButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}