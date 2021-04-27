//
//  ViewController.swift
//  Life Counter
//
//  Created by Jaimie Jin on 4/20/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var losingMessage: UILabel!
    var numPlayer = 4
    var livePlayer = 4;
    var scores = [20, 20, 20, 20, 20, 20, 20, 20]
    var history: [String] = []
    @IBOutlet var buttons: [UILabel]!
    @IBOutlet var addPButton: UIButton!
    @IBOutlet var SubPButton: UIButton!
    @IBOutlet var playerList: [UIStackView]!
    var players = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6", "Player 7", "Player 8"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        losingMessage.isHidden = true;
//        for _ in 1...4 {
//            totalView.addSubview(onePlayer)
//        }
        for i in 4...7 {
            for p in playerList {
                if p.tag == i {
                    p.isHidden = true;
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
      if segue.identifier == "HistorySeg",
         let ViewControllerHistory = segue.destination as? ViewControllerHistory {
        ViewControllerHistory.history = history
      }
    }
    
    func checkScore(score: Int, player: String) {
        if score <= 0 {
            losingMessage.text = "\(player) LOSES!"
            losingMessage.isHidden = false
            addHistory(player: player, action: "lose", num: 0)
            livePlayer -= 1;
        }
        
        if livePlayer == 1 {
            losingMessage.text = "Game Over!"
            reset()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        reset()
    }
    func reset() {
        for b in buttons {
            b.text = "20"
        }
        for i in 0...7 {
            scores[i] = 20
        }
        losingMessage.isHidden = true
        history = []
        if numPlayer != 8 {
            addPButton.isEnabled = true;
        }
        if numPlayer != 2 {
            SubPButton.isEnabled = true;
        }
    }
    
    func findScore(_ tagNum: Int) -> UILabel {
        for b in buttons {
            if (b.tag == tagNum) {
                return b
            }
        }
        return buttons[0]
    }

    @IBAction func Add1(_ sender: UIButton) {
        addPButton.isEnabled = false;
        SubPButton.isEnabled = false;
        losingMessage.isHidden = true;
        scores[sender.tag] += 1;
        let button = findScore(sender.tag)
        button.text = String(scores[sender.tag])
        addHistory(player: players[sender.tag], action: "+", num: 1)
    }
    @IBAction func Add5(_ sender: UIButton) {
        addPButton.isEnabled = false;
        SubPButton.isEnabled = false;
        losingMessage.isHidden = true;
        scores[sender.tag] += 5;
        let button = findScore(sender.tag);
        button.text = String(scores[sender.tag])
        addHistory(player: players[sender.tag], action: "+", num: 5)
    }
    @IBAction func Sub1(_ sender: UIButton) {
        addPButton.isEnabled = false;
        SubPButton.isEnabled = false;
        losingMessage.isHidden = true;
        scores[sender.tag] -= 1;
        let button = findScore(sender.tag);
        button.text = String(scores[sender.tag])
        addHistory(player: players[sender.tag], action: "-", num: 1)
        checkScore(score: scores[sender.tag], player: players[sender.tag])
    }
    @IBAction func Sub5(_ sender: UIButton) {
        addPButton.isEnabled = false;
        SubPButton.isEnabled = false;
        losingMessage.isHidden = true;
        scores[sender.tag] -= 5;
        let button = findScore(sender.tag);
        button.text = String(scores[sender.tag])
        addHistory(player: players[sender.tag], action: "-", num: 5)
        checkScore(score: scores[sender.tag], player: players[sender.tag])
    }
    
    func addHistory(player: String, action: String, num: Int) {
        var text = player
        switch action {
        case "+":
            text += " gained " + String(num) + " life."
        case "-":
            text += " lost " + String(num) + " life."
        default:
            text += " LOSES!"
        }
        history.append(text)
    }

    @IBAction func addPlayer(_ sender: UIButton) {
        for p in playerList {
            if p.tag == numPlayer {
                p.isHidden = false;
                numPlayer += 1;
                livePlayer += 1;
                break;
            }
        }
        if numPlayer == 8 {
            addPButton.isEnabled = false;
        }
        if numPlayer != 2 {
            SubPButton.isEnabled = true;
        }
    }
    
    @IBAction func MinusPlayer(_ sender: UIButton) {
        for p in playerList {
            if p.tag == numPlayer - 1 {
                p.isHidden = true;
                numPlayer -= 1;
                livePlayer -= 1;
                break;
            }
        }
        if numPlayer != 8 {
            addPButton.isEnabled = true;
        }
        if numPlayer == 2 {
            SubPButton.isEnabled = false;
        }
    }
    
}

