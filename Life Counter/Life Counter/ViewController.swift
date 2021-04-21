//
//  ViewController.swift
//  Life Counter
//
//  Created by Jaimie Jin on 4/20/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var play1: UILabel!
    @IBOutlet var play2: UILabel!
    @IBOutlet var play3: UILabel!
    @IBOutlet var play4: UILabel!
    @IBOutlet var losingMessage: UILabel!
    
    var scores = [20, 20, 20, 20];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        losingMessage.isHidden = true;
    }
    func checkScore(score: Int, player: String) {
        if (score <= 0) {
            losingMessage.text = "\(player) LOSES!"
            losingMessage.isHidden = false
        }
    }
    //Player 1
    @IBAction func play1Add1(_ sender: Any) {
        scores[0] += 1;
        play1.text = String(scores[0])
    }
    @IBAction func play1Add5(_ sender: Any) {
        scores[0] += 5;
        play1.text = String(scores[0])
    }
    @IBAction func play1Sub1(_ sender: Any) {
        scores[0] -= 1;
        play1.text = String(scores[0])
        checkScore(score: scores[0], player: "Player 1")
    }
    @IBAction func play1Sub5(_ sender: Any) {
        scores[0] -= 5;
        play1.text = String(scores[0])
        checkScore(score: scores[0], player: "Player 1")
    }
}

