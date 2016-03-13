//
//  ViewController.swift
//  Rushambo
//
//  Created by Youngsun Paik on 3/9/16.
//  Copyright © 2016 Youngsun Paik. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    func randomHandValue() -> String {
        let choicesArray: Array<String> = ["Rock", "Paper", "Scissors"]
        let randomValue: Int = Int(arc4random() % 3)
        return choicesArray[randomValue]
    }
    
    // Code only
    @IBAction func rockButton(sender: UIButton) {
        let controller: ResultViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        //value
        let shape = sender.titleForState(.Normal)
        controller.user = shape
        controller.computer = self.randomHandValue()
        
        presentViewController(controller, animated: true, completion: nil)
        
    }

    // Code and segue
    @IBAction func paperButton(sender: UIButton) {
        self.performSegueWithIdentifier("selectHand", sender: sender)
    }

    // Segue only
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "selectHand" {
        let controller = segue.destinationViewController as! ResultViewController
        //value
        let shape = sender!.titleForState(.Normal)!
        controller.user = shape
        controller.computer = self.randomHandValue()
        }
    }

}

