//
//  ViewController.swift
//  Life Counter
//
//  Created by Jaimie Jin on 4/20/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var losingMessage: UILabel!
    
    var scores = [0, 0, 0, 0]
    @IBOutlet var buttons: [UILabel]!
    var player = ["Player 1", "Player 2", "Player 3", "Player 4"]
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

    @IBAction func Add1(_ sender: UIButton) {
        losingMessage.isHidden = true;
        scores[sender.tag] += 1;
        buttons[sender.tag].text = String(scores[sender.tag])
    }
    @IBAction func Add5(_ sender: UIButton) {
        losingMessage.isHidden = true;
        scores[sender.tag] += 5;
        buttons[sender.tag].text = String(scores[sender.tag])
    }
    @IBAction func Sub1(_ sender: UIButton) {
        losingMessage.isHidden = true;
        scores[sender.tag] -= 1;
        buttons[sender.tag].text = String(scores[sender.tag])
        checkScore(score: scores[sender.tag], player: player[sender.tag])
    }
    @IBAction func Sub5(_ sender: UIButton) {
        losingMessage.isHidden = true;
        scores[sender.tag] -= 5;
        buttons[sender.tag].text = String(scores[sender.tag])
        checkScore(score: scores[sender.tag], player: player[sender.tag])
    }
}

