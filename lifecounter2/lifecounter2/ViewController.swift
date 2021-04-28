//
//  ViewController.swift
//  lifecounter2
//
//  Created by Jaimie Jin on 4/27/21.
//

import UIKit

protocol playerDelegate {
    func addHistory(player: String, action: String, num: Int)
    func checkScore(score: Int, player: String)
    func gameStart()
    func present(alertController: UIAlertController)
    func hideMessage()
}
class ViewController: UIViewController, playerDelegate {
    var numPlayer = 4
    var livePlayer = 4
    var history:[String] = []
    @IBOutlet var losingMessage: UILabel!
    @IBOutlet var subPButton: UIButton!
    @IBOutlet var addPButton: UIButton!
    @IBOutlet var stackView: UIStackView!
    var playerList: [PlayerControlView] = []
    var players = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6", "Player 7", "Player 8"]
    override func viewDidLoad() {
        super.viewDidLoad()
        losingMessage.isHidden = true;
        // Do any additional setup after loading the view.
        for i in 0...3 {
            createPlayer(i: i)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        guard let identifier = segue.identifier else { return }
      if identifier == "HistorySeg",
         let ViewControllerHistory = segue.destination as? ViewControllerHistory {
        ViewControllerHistory.history = history
      }
    }
    func hideMessage() {
        losingMessage.isHidden = true;
    }
    @IBAction func reset(_ sender: Any) {
        resetGame()
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
    
    func checkScore(score: Int, player: String) {
        if score <= 0 {
            losingMessage.text = "\(player) LOSES!"
            losingMessage.isHidden = false
            addHistory(player: player, action: "lose", num: 0)
            livePlayer -= 1;
        }
        perform(#selector(checkGame), with: nil, afterDelay: 0.2)
    }
    
    @objc func checkGame() {
        if livePlayer == 1 {
            losingMessage.text = "Game Over!"
            perform(#selector(resetGame), with: nil, afterDelay: 0.5)
            
        }
    }
    func gameStart() {
        addPButton.isEnabled = false;
        subPButton.isEnabled = false;
    }
    
    @objc func resetGame() {
        for p in playerList {
            p.reset()
        }
        losingMessage.isHidden = true
        history = []
        if numPlayer != 8 {
            addPButton.isEnabled = true;
        }
        if numPlayer != 2 {
            subPButton.isEnabled = true;
        }
        livePlayer = numPlayer
    }
    
    func createPlayer(i: Int) {
        //guard let newPlayer = loadViewFromNib() else { return }
        let newPlayer = PlayerControlView()
        newPlayer.data = (i)
        newPlayer.tag = i
        newPlayer.delegate = self
        playerList.append(newPlayer)
        stackView.addArrangedSubview(newPlayer)
    }
    
    @IBAction func addPlayer(_ sender: UIButton) {
        createPlayer(i: numPlayer)
        numPlayer += 1;
        livePlayer += 1;
        if numPlayer == 8 {
            addPButton.isEnabled = false;
        }
        if numPlayer != 2 {
            subPButton.isEnabled = true;
        }
    }
    
    @IBAction func minusPlayer(_ sender: UIButton) {
        numPlayer -= 1;
        for i in 0...(playerList.count - 1) {
            if playerList[i].tag == numPlayer {
                playerList[i].removeFromSuperview()
                playerList.remove(at: i)
            }
        }
        
        livePlayer -= 1;
        if numPlayer != 8 {
            addPButton.isEnabled = true;
        }
        if numPlayer == 2 {
            subPButton.isEnabled = false;
        }
    }
    
    func present(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
}

